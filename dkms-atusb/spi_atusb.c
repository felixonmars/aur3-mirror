/*
 * spi_atusb - SPI host look-alike for ATUSB
 *
 * Copyright (c) 2011 Richard Sharpe <realrichardsharpe@gmail.com>
 * Copyright (c) 2011 Stefan Schmidt <stefan@datenfreihafen.org>
 * Copyright (c) 2011 Werner Almesberger <werner@almesberger.net>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, version 2
 *
 */

/*
 * - implement more robust interrupt synchronization
 * - check URB killing in atusb_disconnect for races
 * - switch from bulk to interrupt endpoint
 * - implement buffer read without extra copy
 * - harmonize indentation style
 * - mv atusb.c ../ieee802.15.4/spi_atusb.c, or maybe atrf_atusb.c or such
 * - check module load/unload
 * - review dev_* severity levels
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/jiffies.h>
#include <linux/timer.h>
#include <linux/interrupt.h>
#include <linux/irq.h>
#include <linux/usb.h>
#include <linux/spi/spi.h>
//#include <linux/spi/at86rf230.h>

#include "at86rf230.h"


#define	SYNC_TIMEOUT_MS	50	/* assume interrupt has been synced after
				   waiting this long */

#define VENDOR_ID     0x20b7
#define PRODUCT_ID    0x1540

/* The devices we work with */
static const struct usb_device_id atusb_device_table[] = {
	{ USB_DEVICE(VENDOR_ID, PRODUCT_ID) },
	{ },
};
MODULE_DEVICE_TABLE(usb, atusb_device_table);

#define ATUSB_BUILD_SIZE 256
struct atusb_local {
	struct usb_device * udev;
	/* The interface to the RF part info, if applicable */
	uint8_t ep0_atusb_major;
	uint8_t ep0_atusb_minor;
	uint8_t atusb_hw_type;
	struct spi_master *master;
	int slave_irq;
	struct urb *irq_urb;
	uint8_t irq_buf;		/* receive irq serial here*/
	uint8_t irq_seen;		/* last irq serial from bulk */
	uint8_t irq_sync;		/* last irq serial from WRITE2_SYNC */
	struct tasklet_struct task;	/* interrupt delivery tasklet */
	struct timer_list timer;	/* delay, for interrupt synch */
	struct at86rf230_platform_data platform_data;
	/* copy platform_data so that we can adapt .reset_data */
	struct spi_device *spi;
//	unsigned char buffer[3];
	unsigned char buffer[260];	/* XXL, just in case */
	struct spi_message *msg;
};

/* Commands to our device. Make sure this is synced with the firmware */
enum atspi_requests {
	ATUSB_ID			= 0x00,	/* system status/control grp */
	ATUSB_BUILD,
	ATUSB_RESET,
	ATUSB_RF_RESET			= 0x10,	/* debug/test group */
	ATUSB_POLL_INT,
	ATUSB_TEST,			/* atusb-sil only */
	ATUSB_TIMER,
	ATUSB_GPIO,
	ATUSB_SLP_TR,
	ATUSB_GPIO_CLEANUP,
	ATUSB_REG_WRITE			= 0x20,	/* transceiver group */
	ATUSB_REG_READ,
	ATUSB_BUF_WRITE,
	ATUSB_BUF_READ,
	ATUSB_SRAM_WRITE,
	ATUSB_SRAM_READ,
	ATUSB_SPI_WRITE			= 0x30,	/* SPI group */
	ATUSB_SPI_READ1,
	ATUSB_SPI_READ2,
	ATUSB_SPI_WRITE2_SYNC,
};

/*
 * Direction	bRequest		wValue		wIndex	wLength
 *
 * ->host	ATUSB_ID		-		-	3
 * ->host	ATUSB_BUILD		-		-	#bytes
 * host->	ATUSB_RESET		-		-	0
 *
 * host->	ATUSB_RF_RESET		-		-	0
 * ->host	ATUSB_POLL_INT		-		-	1
 * host->	ATUSB_TEST		-		-	0
 * ->host	ATUSB_TIMER		-		-	#bytes (6)
 * ->host	ATUSB_GPIO		dir+data	mask+p#	3
 * host->	ATUSB_SLP_TR		-		-	0
 * host->	ATUSB_GPIO_CLEANUP	-		-	0
 *
 * host->	ATUSB_REG_WRITE		value		addr	0
 * ->host	ATUSB_REG_READ		-		addr	1
 * host->	ATUSB_BUF_WRITE		-		-	#bytes
 * ->host	ATUSB_BUF_READ		-		-	#bytes
 * host->	ATUSB_SRAM_WRITE	-		addr	#bytes
 * ->host	ATUSB_SRAM_READ		-		addr	#bytes
 *
 * host->	ATUSB_SPI_WRITE		byte0		byte1	#bytes
 * ->host	ATUSB_SPI_READ1		byte0		-	#bytes
 * ->host	ATUSB_SPI_READ2		byte0		byte1	#bytes
 * ->host	ATUSB_SPI_WRITE2_SYNC	byte0		byte1	0/1
 */

#define ATUSB_FROM_DEV (USB_TYPE_VENDOR | USB_DIR_IN)
#define ATUSB_TO_DEV (USB_TYPE_VENDOR | USB_DIR_OUT)


/* ----- Control transfers ------------------------------------------------- */


static int atusb_async_errchk(struct urb *urb)
{
	struct atusb_local *atusb = urb->context;
	struct spi_message *msg = atusb->msg;
	struct usb_device *dev = atusb->udev;

	if (!urb->status) {
		dev_dbg(&dev->dev, "atusb_async_errchk OK len %d\n",
		    urb->actual_length);
		return 0;
	}
	
	if (urb->status != -ENOENT && urb->status != -ECONNRESET &&
	    urb->status != -ESHUTDOWN)
		dev_info(&dev->dev, "atusb_async_errchk FAIL error %d\n",
		    urb->status);

	msg->actual_length = 0;

	return urb->status;
}

static void atusb_async_finish(struct urb *urb)
{
	struct atusb_local *atusb = urb->context;
	struct spi_message *msg = atusb->msg;

	msg->status = urb->status;
	msg->complete(msg->context);

	kfree(urb->setup_packet);
	usb_free_urb(urb);
}

static void atusb_ctrl_cb(struct urb *urb)
{
	atusb_async_errchk(urb);
	atusb_async_finish(urb);
}

static void atusb_timer(unsigned long data)
{
	struct urb *urb = (void *) data;

	dev_warn(&urb->dev->dev, "atusb_timer\n");
	atusb_async_finish(urb);
}

static void atusb_ctrl_cb_sync(struct urb *urb)
{
	struct atusb_local *atusb = urb->context;

	/* @@@ needs locking/atomic */
	if (atusb_async_errchk(urb) || atusb->irq_sync == atusb->irq_seen) {
		atusb_async_finish(urb);
		return;
	}
	
	BUG_ON(timer_pending(&atusb->timer));
	atusb->timer.expires = jiffies+msecs_to_jiffies(SYNC_TIMEOUT_MS);
	atusb->timer.data = (unsigned long) urb;
	add_timer(&atusb->timer);
}

static void atusb_read_fb_cb(struct urb *urb)
{
	struct atusb_local *atusb = urb->context;
	struct spi_message *msg = atusb->msg;
	const struct spi_transfer *xfer;
	uint8_t *rx;

	if (!atusb_async_errchk(urb)) {
		BUG_ON(!urb->actual_length);

		xfer = list_first_entry(&msg->transfers, struct spi_transfer,
		    transfer_list);
		rx = xfer->rx_buf;
		rx[1] = atusb->buffer[0];

		xfer = list_entry(xfer->transfer_list.next,
		    struct spi_transfer, transfer_list);
		memcpy(xfer->rx_buf, atusb->buffer+1, urb->actual_length-1);
	}

	atusb_async_finish(urb);
}

static int submit_control_msg(struct atusb_local *atusb,
    __u8 request, __u8 requesttype, __u16 value, __u16 index,
    void *data, __u16 size, usb_complete_t complete_fn, void *context)
{
	struct usb_device *dev = atusb->udev;
	struct usb_ctrlrequest *req;
	struct urb *urb;
	int retval = -ENOMEM;

	req = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
	if (!req)
		return -ENOMEM;

	req->bRequest = request;
	req->bRequestType = requesttype;
	req->wValue = cpu_to_le16(value);
	req->wIndex = cpu_to_le16(index);
	req->wLength = cpu_to_le16(size);

	urb = usb_alloc_urb(0, GFP_KERNEL);
	if (!urb)
		goto out_nourb;

	usb_fill_control_urb(urb, dev,
	    requesttype == ATUSB_FROM_DEV ?
	      usb_rcvctrlpipe(dev, 0) : usb_sndctrlpipe(dev, 0),
	    (unsigned char *) req, data, size, complete_fn, context);

	retval = usb_submit_urb(urb, GFP_KERNEL);
	if (!retval)
		return 0;
	dev_warn(&dev->dev, "failed submitting read urb, error %d",
		retval);
	retval = retval == -ENOMEM ? retval : -EIO;

	usb_free_urb(urb);
out_nourb:
	kfree(req);

	return retval;
}


/* ----- SPI transfers ----------------------------------------------------- */


static int atusb_read1(struct atusb_local *atusb,
    uint8_t tx, uint8_t *rx, int len)
{
	dev_dbg(&atusb->udev->dev, "atusb_read1: tx = 0x%x\n", tx);
	return submit_control_msg(atusb,
	    ATUSB_SPI_READ1, ATUSB_FROM_DEV, tx, 0,
	    rx, 1, atusb_ctrl_cb, atusb);
}

static int atusb_read_fb(struct atusb_local *atusb,
    uint8_t tx, uint8_t *rx0, uint8_t *rx, int len)
{
	dev_dbg(&atusb->udev->dev, "atusb_read_fb: tx = 0x%x\n", tx);
	return submit_control_msg(atusb,
	    ATUSB_SPI_READ1, ATUSB_FROM_DEV, tx, 0,
	    atusb->buffer, len+1, atusb_read_fb_cb, atusb);
}

static int atusb_write(struct atusb_local *atusb,
    uint8_t tx0, uint8_t tx1, const uint8_t *tx, int len)
{
	dev_dbg(&atusb->udev->dev,
	    "atusb_write: tx0 = 0x%x tx1 = 0x%x\n", tx0, tx1);

	/*
	 * The AT86RF230 driver sometimes requires a transceiver state
	 * transition to be an interrupt barrier. This is the case after
	 * writing FORCE_TX_ON to the TRX_CMD field in the TRX_STATE register.
	 *
	 * Since there is no other means of notification, we just decode the
	 * transfer and do a bit of pattern matching.
	 */
	if (tx0 == (CMD_REG | CMD_WRITE | RG_TRX_STATE) &&
	    (tx1 & 0x1f) == STATE_FORCE_TX_ON)
		return submit_control_msg(atusb,
		    ATUSB_SPI_WRITE2_SYNC, ATUSB_FROM_DEV, tx0, tx1,
		     &atusb->irq_sync, 1, atusb_ctrl_cb_sync, atusb);
	else
		return submit_control_msg(atusb,
		    ATUSB_SPI_WRITE, ATUSB_TO_DEV, tx0, tx1,
		    (uint8_t *) tx, len, atusb_ctrl_cb, atusb);
}

static int atusb_transfer(struct spi_device *spi, struct spi_message *msg)
{
	struct atusb_local *atusb = spi_master_get_devdata(spi->master);
	struct spi_transfer *xfer;
	struct spi_transfer *x[2];
	int n;
	const uint8_t *tx;
	uint8_t *rx;
	int len;
	int retval = 0;

	if (unlikely(list_empty(&msg->transfers))) {
		dev_err(&atusb->udev->dev, "transfer is empty\n");
		return -EINVAL;
	}

	atusb->msg = msg;

	/* Classify the request */
	n = 0;
	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
		if (n == ARRAY_SIZE(x)) {
			dev_err(&atusb->udev->dev, "too many transfers\n");
			return -EINVAL;
		}
		x[n] = xfer;
		n++;
	}

	tx = x[0]->tx_buf;
	rx = x[0]->rx_buf;
	len = x[0]->len;

	msg->actual_length = len;

	if (!tx || len != 2)
		goto bad_req;
	if (n == 1) {
		if (rx) {
			dev_dbg(&atusb->udev->dev, "read 1\n");
			retval = atusb_read1(atusb, tx[0], rx+1, len-1);
		} else {
			dev_dbg(&atusb->udev->dev, "write 2\n");
			/*
			 * Don't take our clock away !! ;-)
			 */
			if (tx[0] == (CMD_REG | CMD_WRITE | RG_TRX_CTRL_0)) {
				msg->status = 0;
				msg->complete(msg->context);
			} else {
				retval = atusb_write(atusb,
				    tx[0], tx[1], NULL, 0);
			}
		}
	} else {
		if (x[0]->rx_buf) {
			if (x[1]->tx_buf || !x[1]->rx_buf)
				goto bad_req;
			dev_dbg(&atusb->udev->dev, "read 1+\n");
			retval = atusb_read_fb(atusb, tx[0], rx+1,
			    x[1]->rx_buf, x[1]->len);
		} else {
			if (!x[1]->tx_buf ||x[1]->rx_buf)
				goto bad_req;
			dev_dbg(&atusb->udev->dev, "write 2+n\n");
			retval = atusb_write(atusb, tx[0], tx[1],
			    x[1]->tx_buf, x[1]->len);
		}
	}
	return retval;

bad_req:
	dev_err(&atusb->udev->dev, "unrecognized request:\n");
	list_for_each_entry(xfer, &msg->transfers, transfer_list)
		dev_err(&atusb->udev->dev, "%stx %srx len %u\n",
		    xfer->tx_buf ? "" : "!", xfer->rx_buf ? " " : "!",
		    xfer->len);
	return -EINVAL;
}

static int atusb_setup(struct spi_device *spi)
{
	return 0;
}


/* ----- Interrupt handling ------------------------------------------------ */


static void atusb_tasklet(unsigned long data)
{
	struct atusb_local *atusb = (void *) data;

	generic_handle_irq(atusb->slave_irq);
}

static void atusb_irq(struct urb *urb)
{
	struct atusb_local *atusb = urb->context;

	dev_dbg(&urb->dev->dev, "atusb_irq (%d), seen %d sync %d\n",
	    urb->status, atusb->irq_buf, atusb->irq_sync);
	if (!urb->status) {
		atusb->irq_seen = atusb->irq_buf;
		if (atusb->irq_sync == atusb->irq_seen &&
		    try_to_del_timer_sync(&atusb->timer) == 1)
			atusb_async_finish((struct urb *) atusb->timer.data);
	}
	usb_free_urb(urb);
	atusb->irq_urb = NULL;
	tasklet_schedule(&atusb->task);
}

static int atusb_arm_interrupt(struct atusb_local *atusb)
{
	struct usb_device *dev = atusb->udev;
	struct urb *urb;
	int retval = -ENOMEM;

	BUG_ON(atusb->irq_urb);

	dev_vdbg(&dev->dev, "atusb_arm_interrupt\n");
	urb = usb_alloc_urb(0, GFP_KERNEL);
	if (!urb) {
		dev_err(&dev->dev,
		    "atusb_arm_interrupt: usb_alloc_urb failed\n");
		return -ENOMEM;
	}

	usb_fill_bulk_urb(urb, dev, usb_rcvbulkpipe(dev, 1),
	    &atusb->irq_buf, 1, atusb_irq, atusb);
	atusb->irq_urb = urb;
	retval = usb_submit_urb(urb, GFP_KERNEL);
	if (!retval)
		return 0;

	dev_err(&dev->dev, "failed submitting bulk urb, error %d\n", retval);
	retval = retval == -ENOMEM ? retval : -EIO;

	usb_free_urb(urb);

	return retval;
}

static void atusb_irq_mask(struct irq_data *data)
{
	struct atusb_local *atusb = irq_data_get_irq_chip_data(data);

	dev_vdbg(&atusb->udev->dev, "atusb_irq_mask\n");
	tasklet_disable_nosync(&atusb->task);
}

static void atusb_irq_unmask(struct irq_data *data)
{
	struct atusb_local *atusb = irq_data_get_irq_chip_data(data);

	dev_vdbg(&atusb->udev->dev, "atusb_irq_unmask\n");
	tasklet_enable(&atusb->task);
}

static void atusb_irq_ack(struct irq_data *data)
{
	struct atusb_local *atusb = irq_data_get_irq_chip_data(data);

	dev_vdbg(&atusb->udev->dev, "atusb_irq_ack\n");
	atusb_arm_interrupt(atusb);
}

static struct irq_chip atusb_irq_chip = {
	.name		= "atusb-slave",
	.irq_mask	= atusb_irq_mask,
	.irq_unmask	= atusb_irq_unmask,
	.irq_ack	= atusb_irq_ack,
};


/* ----- Transceiver reset ------------------------------------------------- */


static void atusb_reset(void *reset_data)
{
	int retval;
	struct atusb_local *atusb = reset_data;

	retval = usb_control_msg(atusb->udev,
	    usb_rcvctrlpipe(atusb->udev, 0),
	    ATUSB_RF_RESET, ATUSB_TO_DEV, 0, 0,
	    NULL, 0, 1000);
	if (retval < 0) {
		dev_err(&atusb->udev->dev,
			"%s: error doing reset retval = %d\n",
			__func__, retval);
	}
}


/* ----- Firmware version information -------------------------------------- */


static int atusb_get_and_show_revision(struct atusb_local *atusb)
{
	struct usb_device *dev = atusb->udev;
	int retval;

	/* Get a couple of the ATMega Firmware values */
	retval = usb_control_msg(dev,
	    usb_rcvctrlpipe(dev, 0),
	    ATUSB_ID, ATUSB_FROM_DEV, 0, 0,
	    atusb->buffer, 3, 1000);
	if (retval < 0) {
		dev_info(&dev->dev,
		    "failed submitting urb for ATUSB_ID, error %d\n", retval);
		return retval == -ENOMEM ? retval : -EIO;
	}

	atusb->ep0_atusb_major = atusb->buffer[0];
	atusb->ep0_atusb_minor = atusb->buffer[1];
	atusb->atusb_hw_type   = atusb->buffer[2];
	dev_info(&dev->dev,
	    "Firmware: major: %u, minor: %u, hardware type: %u\n",
	    atusb->ep0_atusb_major, atusb->ep0_atusb_minor,
	    atusb->atusb_hw_type);

	return 0;
}

static int atusb_get_and_show_build(struct atusb_local *atusb)
{
	struct usb_device *dev = atusb->udev;
	char build[ATUSB_BUILD_SIZE+1];
	int retval;

	retval = usb_control_msg(dev,
	    usb_rcvctrlpipe(atusb->udev, 0),
	    ATUSB_BUILD, ATUSB_FROM_DEV, 0, 0,
	    build, ATUSB_BUILD_SIZE, 1000);
	if (retval < 0) {
		dev_err(&dev->dev,
		    "failed submitting urb for ATUSB_BUILD, error %d\n",
		    retval);
		return retval == -ENOMEM ? retval : -EIO;
	}

	build[retval] = 0;
	dev_info(&dev->dev, "Firmware: build %s\n", build);

	return 0;
}


/* ----- Setup ------------------------------------------------------------- */


struct at86rf230_platform_data at86rf230_platform_data = {
	.rstn	= -1,
	.slp_tr	= -1,
	.dig2	= -1,
	.reset	= atusb_reset,
	/* set .reset_data later */
};

static int atusb_probe(struct usb_interface *interface,
			const struct usb_device_id *id)
{
	struct spi_board_info board_info = {
		.modalias = "at86rf230",
		/* set .irq later */
		.chip_select = 0,
		.bus_num = -1,
		.max_speed_hz = 8 * 1000 * 1000,
	};

	struct usb_device *udev = interface_to_usbdev(interface);
	struct atusb_local *atusb = NULL;
	struct spi_master *master;
	int retval;

	/*
	 * Ignore all interfaces used for DFU, i.e., everything while in the
	 * boot loader, and interface #1 when in the application.
	 */
	if (interface->cur_altsetting->desc.bInterfaceClass !=
	    USB_CLASS_VENDOR_SPEC) {
		dev_dbg(&udev->dev,
			"Ignoring interface with class 0x%02x\n",
			interface->cur_altsetting->desc.bInterfaceClass);
		return -ENODEV;
	}

	master = spi_alloc_master(&udev->dev, sizeof(*atusb));
	if (!master)
		return -ENOMEM;

	atusb = spi_master_get_devdata(master);

	atusb->udev = usb_get_dev(udev);
	usb_set_intfdata(interface, atusb);

	atusb->master = spi_master_get(master);

	master->mode_bits	= SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
	master->bus_num		= -1;
	master->num_chipselect	= 1;
	master->setup		= atusb_setup;
	master->transfer	= atusb_transfer;

	atusb->slave_irq = irq_alloc_desc(numa_node_id());
	if (atusb->slave_irq < 0) {
		dev_err(&udev->dev, "can't allocate slave irq\n");
		retval = -ENXIO;
		goto err_free;
	}

	irq_set_chip_data(atusb->slave_irq, atusb);
	irq_set_chip(atusb->slave_irq, &atusb_irq_chip);
	__irq_set_handler(atusb->slave_irq, handle_level_irq, 0, NULL);

	/* FIXME prepare USB IRQ */

	retval = spi_register_master(master);
	if (retval < 0) {
		dev_err(&udev->dev, "can't register spi master\n");
		goto err_slave_irq;
	}

	atusb->platform_data = at86rf230_platform_data;
	atusb->platform_data.reset_data = atusb;
	board_info.platform_data = &atusb->platform_data;
	board_info.irq = atusb->slave_irq;

	init_timer(&atusb->timer);
	atusb->timer.function = atusb_timer;

	tasklet_init(&atusb->task, atusb_tasklet, (unsigned long) atusb);
	tasklet_disable(&atusb->task);
	atusb_arm_interrupt(atusb);

	if (atusb_get_and_show_revision(atusb) < 0)
		goto err_master;
	if (atusb_get_and_show_build(atusb) < 0)
		goto err_master;

	atusb->spi = spi_new_device(master, &board_info);
	if (!atusb->spi) {
		dev_err(&udev->dev, "can't create new device for %s\n",
		    board_info.modalias);
		goto err_master;
	}

	dev_info(&atusb->spi->dev,
	    "ATUSB ready for mischief (IRQ %d)\n", board_info.irq);

	return 0;

err_master:
	/*
	 * If we come here from a partially successful driver initialization,
	 * we don't really know how much it has done. In particular, it may
	 * have triggered an interrupt and thus removed the interrupt URB and
	 * maybe scheduled the tasklet.
	 */
	tasklet_disable(&atusb->task);
	if (atusb->irq_urb)
		usb_kill_urb(atusb->irq_urb);
	spi_master_put(atusb->master);
err_slave_irq:
	irq_set_chained_handler(atusb->slave_irq, NULL);
	irq_set_chip_data(atusb->slave_irq, NULL);
	irq_free_desc(atusb->slave_irq);
err_free:
	return retval;
}

static void atusb_disconnect(struct usb_interface *interface)
{
	struct atusb_local *atusb = usb_get_intfdata(interface);
	struct spi_master *master = atusb->master;

	tasklet_disable(&atusb->task);
	/* @@@ this needs some extra protecion - wa */
	if (atusb->irq_urb)
		usb_kill_urb(atusb->irq_urb);

	BUG_ON(timer_pending(&atusb->timer));

	usb_set_intfdata(interface, NULL);
	usb_put_dev(atusb->udev);

	spi_dev_put(atusb->spi);

	spi_unregister_master(master);

	irq_set_chained_handler(atusb->slave_irq, NULL);
	irq_set_chip_data(atusb->slave_irq, NULL);
	irq_free_desc(atusb->slave_irq);

	spi_master_put(master);
}

void atusb_release(struct device *dev)
{
	return;
}

static struct usb_driver atusb_driver = {
	.name		= "atusb_ben-wpan",
	.probe		= atusb_probe,
	.disconnect	= atusb_disconnect,
	.id_table	= atusb_device_table,
};

static struct platform_device atusb_device = {
	.name = "spi_atusb",
	.id = -1,
	.dev.release = atusb_release,
};

static int __init atusb_init(void)
{
	int retval;

	retval = platform_device_register(&atusb_device);
	if (retval)
		return retval;

	return usb_register(&atusb_driver);
}

static void __exit atusb_exit(void)
{
	usb_deregister(&atusb_driver);
	platform_device_unregister(&atusb_device);
}

module_init (atusb_init);
module_exit (atusb_exit);

MODULE_AUTHOR("Richard Sharpe <realrichardsharpe@gmail.com>");
MODULE_AUTHOR("Stefan Schmidt <stefan@datenfreihafen.org>");
MODULE_AUTHOR("Werner Almesberger <werner@almesberger.net>");
MODULE_DESCRIPTION("ATUSB ben-wpan Driver");
MODULE_LICENSE("GPL");
