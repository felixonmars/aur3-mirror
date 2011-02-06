/*
 *  Display backlight Driver for Apple machines
 *
 *  Copyright (c) Red Hat <mjg@redhat.com>
 *  Based on code from Pommed:
 *  Copyright (C) 2006 Nicolas Boichat <nicolas @boichat.ch>
 *  Copyright (C) 2006 Felipe Alfaro Solana <felipe_alfaro @linuxmail.org>
 *  Copyright (C) 2007 Julien BLACHE <jb@jblache.org>
 *  Copyright (c) 2008-2009 Mario Schwalbe <schwalbe@inf.tu-dresden.de>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 *
 *  This driver triggers SMIs which cause the firmware to change the
 *  backlight brightness. This is icky in many ways, but it's impractical to
 *  get at the firmware code in order to figure out what it's actually doing.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/backlight.h>
#include <linux/err.h>
#include <linux/dmi.h>
#include <linux/io.h>
#include <linux/version.h>

/* Check for the new backlight suspend/resume feature */
#if defined(BL_CORE_SUSPENDRESUME)
	#define  USE_BACKLIGHT_SUSPEND
/* Otherwise use a platform driver if PM is enabled */
#elif defined(CONFIG_PM)
	#warning USE_PLATFORM_DRIVER
	#define  USE_PLATFORM_DRIVER
	#undef   __initdata
	#define  __initdata /* nothing */
#endif

/* check whether backlight props.state is present */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31)
	#define HAVE_BACKLIGHT_PROPS_STATE
#endif

/* check whether we have to initialize backlight props */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34)
	#define INIT_BACKLIGHT_PROPS
#endif

static struct backlight_device *mbp_backlight_device;

/* Structure to be passed to the DMI_MATCH function. */
struct dmi_match_data {
	/* I/O resource to allocate. */
	unsigned long iostart;
	unsigned long iolen;
	/* Backlight operations structure. */
	const struct backlight_ops backlight_ops;
};

/* Module parameters. */
static int debug;
module_param_named(debug, debug, int, 0644);
MODULE_PARM_DESC(debug, "Set to one to enable debugging messages.");

/*
 * Implementation for MacBooks with Intel chipset.
 */
static int intel_chipset_send_intensity(struct backlight_device *bd)
{
	int intensity = bd->props.brightness;

#ifdef HAVE_BACKLIGHT_PROPS_STATE
	if (bd->props.state & BL_CORE_FBBLANK)
		intensity = 0;
	else if (bd->props.state & BL_CORE_SUSPENDED)
		intensity = 0;
#endif

	if (debug)
		printk(KERN_DEBUG "mbp_nvidia_bl: setting brightness to %d\n",
		       intensity);

	outb(0x04 | (intensity << 4), 0xb3);
	outb(0xbf, 0xb2);
	return 0;
}

static int intel_chipset_get_intensity(struct backlight_device *bd)
{
	int intensity;

	outb(0x03, 0xb3);
	outb(0xbf, 0xb2);
	intensity = inb(0xb3) >> 4;

	if (debug)
		printk(KERN_DEBUG "mbp_nvidia_bl: read brightness of %d\n",
		       intensity);

	return intensity;
}

static const struct dmi_match_data intel_chipset_data = {
	.iostart		= 0xb2,
	.iolen			= 2,
	.backlight_ops		= {
#ifdef USE_BACKLIGHT_SUSPEND
		.options        = BL_CORE_SUSPENDRESUME,
#endif
		.get_brightness	= intel_chipset_get_intensity,
		.update_status	= intel_chipset_send_intensity,
	}
};

/*
 * Implementation for MacBooks with Nvidia chipset.
 */
static int nvidia_chipset_send_intensity(struct backlight_device *bd)
{
	int intensity = bd->props.brightness;

#ifdef HAVE_BACKLIGHT_PROPS_STATE
	if (bd->props.state & BL_CORE_FBBLANK)
		intensity = 0;
	else if (bd->props.state & BL_CORE_SUSPENDED)
		intensity = 0;
#endif

	if (debug)
		printk(KERN_DEBUG "mbp_nvidia_bl: setting brightness to %d\n",
		       intensity);

	outb(0x04 | (intensity << 4), 0x52f);
	outb(0xbf, 0x52e);
	return 0;
}

static int nvidia_chipset_get_intensity(struct backlight_device *bd)
{
	int intensity;

	outb(0x03, 0x52f);
	outb(0xbf, 0x52e);
	intensity = inb(0x52f) >> 4;

	if (debug)
		printk(KERN_DEBUG "mbp_nvidia_bl: read brightness of %d\n",
		       intensity);

	return intensity;
}

static const struct dmi_match_data nvidia_chipset_data = {
	.iostart		= 0x52e,
	.iolen			= 2,
	.backlight_ops		= {
#ifdef USE_BACKLIGHT_SUSPEND
		.options        = BL_CORE_SUSPENDRESUME,
#endif
		.get_brightness	= nvidia_chipset_get_intensity,
		.update_status	= nvidia_chipset_send_intensity
	}
};

/*
 * DMI matching.
 */
static /* const */ struct dmi_match_data *driver_data;

static int mbp_dmi_match(const struct dmi_system_id *id)
{
	driver_data = id->driver_data;

	printk(KERN_INFO "mbp_nvidia_bl: %s detected\n", id->ident);
	return 1;
}

static const struct dmi_system_id __initdata mbp_device_table[] = {
	/*
	 * Intel chipset machines
	 */
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 1,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook1,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 2,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook2,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 3,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook3,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 4,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook4,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 4,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook4,2"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 1,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro1,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 1,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro1,2"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 2,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro2,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 2,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro2,2"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 3,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro3,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 3,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro3,2"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 4,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro4,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookAir 1,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookAir1,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	/*
	 * Nvidia chipset machines
	 */
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 5,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5,1"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 5,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5,2"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBook 6,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook6,1"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookAir 2,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookAir2,1"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 5,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,1"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 5,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,2"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 5,3",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,3"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 5,4",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,4"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 5,5",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,5"),
		},
		.driver_data	= (void *)&nvidia_chipset_data,
	},
	/*
	 * Nvidia chipset machines: Mid 2010 
	 *     use the old (intel) registers again
	 *     MacBook Pro 6,1  = 17''
	 *     MacBook Pro 6,2  = 15''
	 *     MacBook Pro 7,1  = 13''
	 */
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 6,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro6,1"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 6,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro6,2"),
		},
		.driver_data	= (void *)&intel_chipset_data,
	},
#if 0
	{
		.callback	= mbp_dmi_match,
		.ident		= "MacBookPro 7,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro7,1"),
		},
		/* unconfirmed: which method to use? */
		.driver_data	= (void *)&intel_chipset_data,
		.driver_data	= (void *)&nvidia_chipset_data,
	},
#endif
	{ }
};

/*
 * Driver implementation.
 */
#ifdef USE_PLATFORM_DRIVER
static int mbp_probe(struct platform_device *pdev)
#else
static int __init mbp_init(void)
#endif
{
#ifdef INIT_BACKLIGHT_PROPS
	struct backlight_properties props;
#endif

#ifndef USE_PLATFORM_DRIVER
	if (!dmi_check_system(mbp_device_table))
		return -ENODEV;
#endif

	if (!request_region(driver_data->iostart, driver_data->iolen,
				"Macbook Pro backlight"))
		return -ENXIO;

#ifdef INIT_BACKLIGHT_PROPS
	memset(&props, 0, sizeof(struct backlight_properties));
	props.max_brightness = 15;
	mbp_backlight_device = backlight_device_register("mbp_backlight", NULL,
							 NULL,
							 &driver_data->backlight_ops,
							 &props);
#else
	mbp_backlight_device = backlight_device_register("mbp_backlight",
					NULL, NULL, &driver_data->backlight_ops);
#endif

	if (IS_ERR(mbp_backlight_device)) {
		release_region(driver_data->iostart, driver_data->iolen);
		return PTR_ERR(mbp_backlight_device);
	}

#ifndef INIT_BACKLIGHT_PROPS
	mbp_backlight_device->props.max_brightness = 15;
#endif
	mbp_backlight_device->props.brightness =
		driver_data->backlight_ops.get_brightness(mbp_backlight_device);
	backlight_update_status(mbp_backlight_device);

	return 0;
}

#ifdef USE_PLATFORM_DRIVER
static int mbp_remove(struct platform_device *pdev)
#else
static void __exit mbp_exit(void)
#endif
{
	backlight_device_unregister(mbp_backlight_device);

	release_region(driver_data->iostart, driver_data->iolen);
#ifdef USE_PLATFORM_DRIVER
	return 0;
#endif
}

/*
 * Platform driver implementation
 */
#ifdef USE_PLATFORM_DRIVER

static int mbp_resume(struct platform_device *pdev)
{
	/*
	 * Nvidia GeForce 8600M GT in MacBookPro 3,1 and MacBookPro 4,1:
	 *   1. Resume after suspend:
	 *      SMI still reports the last recently written value, while
	 *      the brightness is actually at its maximum.
	 *   2. Resume after hibernation:
	 *      SMI reports the actual (maximum) value, but the state
	 *      in props.brightness might be different.
	 * -> Re-send to fix (1), but do not re-read to fix (2).
	 */
	if (debug)
		printk(KERN_DEBUG "mbp_nvidia_bl: resuming with"
		       " brightness %d\n", mbp_backlight_device->props.brightness);

	backlight_update_status(mbp_backlight_device);
	return 0;
}

static struct platform_driver mbp_driver = {
	.probe          = mbp_probe,
	.remove         = mbp_remove,
	.resume         = mbp_resume,
	.driver         = {
		.owner  = THIS_MODULE,
		.name   = "mbp_nvidia_bl"
	},
};

static struct platform_device *mbp_platform_device;

static int __init mbp_init(void)
{
	int err;

	if (!dmi_check_system(mbp_device_table))
		return -ENODEV;

	err = platform_driver_register(&mbp_driver);
	if (err)
		return err;

	mbp_platform_device = platform_device_register_simple("mbp_nvidia_bl", -1, NULL, 0);
	if (!mbp_platform_device) {
		platform_driver_unregister(&mbp_driver);
		return -ENOMEM;
	}

	return 0;
}

static void __exit mbp_exit(void)
{
	platform_device_unregister(mbp_platform_device);
	platform_driver_unregister(&mbp_driver);
}

#endif /* USE_PLATFORM_DRIVER */

module_init(mbp_init);
module_exit(mbp_exit);

MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
MODULE_DESCRIPTION("Nvidia-based Macbook Pro Backlight Driver");
MODULE_LICENSE("GPL");
MODULE_DEVICE_TABLE(dmi, mbp_device_table);

