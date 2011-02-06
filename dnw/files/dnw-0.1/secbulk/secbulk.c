#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/usb.h>
#include <linux/fs.h>
#include <linux/mutex.h>
#include <linux/slab.h>
#include <linux/uaccess.h>

#define SECBULK_MAJOR	102
#define SECBULK_MINOR	0
#define DRIVER_NAME	"secbulk"

#define BULKOUT_BUFFER_SIZE	512

struct secbulk_dev
{
	struct usb_device *udev;
	struct mutex io_mutex;
	char*	bulkout_buffer;
	__u8	bulk_out_endpointAddr;
};

static struct usb_class_driver secbulk_class;

static struct usb_device_id secbulk_table[]= {
	{ USB_DEVICE(0x5345, 0x1234)},
	{ }
};

static struct usb_driver secbulk_driver;
static void secbulk_disconnect(struct usb_interface *interface)
{
	struct secbulk_dev *dev = NULL;
	printk(KERN_INFO "secbulk:secbulk disconnected!\n");
	dev = usb_get_intfdata(interface);
	if( NULL != dev )
		kfree(dev);
	usb_deregister_dev(interface, &secbulk_class);
	return;
}

static ssize_t secbulk_read(struct file *file, char __user *buf, size_t len, loff_t *loff)
{
	return -EPERM;
}

static ssize_t secbulk_write(struct file *file, const char __user *buf, size_t len, loff_t *loff)
{
	size_t to_write;
	struct secbulk_dev *dev = file->private_data;
	int ret;
	int actual_length;
	size_t total_writed;
	
	total_writed = 0;
	while(len > 0)
	{
		to_write = min(len, BULKOUT_BUFFER_SIZE);
	
		if(copy_from_user(dev->bulkout_buffer, buf+total_writed, to_write))
		{
			printk(KERN_ERR "secbulk:copy_from_user failed!\n");
			return -EFAULT;	
		}	

		ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, dev->bulk_out_endpointAddr),
				dev->bulkout_buffer,
				to_write,
				&actual_length,
				3*HZ);
		if(ret || actual_length!=to_write)
		{	
			printk(KERN_ERR "secbulk:usb_bulk_msg failed!\n");
			return -EFAULT;
		}	
		len -= to_write;
		total_writed += to_write;
	}	
	return total_writed;
}

static int secbulk_open(struct inode *node, struct file *file)
{
	struct usb_interface *interface;
	struct secbulk_dev *dev;
	
	interface = usb_find_interface(&secbulk_driver, iminor(node));
	if(!interface)
		return -ENODEV;

	dev = usb_get_intfdata(interface);
	dev->bulkout_buffer = kzalloc(BULKOUT_BUFFER_SIZE, GFP_KERNEL);
	if(!(dev->bulkout_buffer))
		return -ENOMEM;
	if(!mutex_trylock(&dev->io_mutex))
		return -EBUSY;
	file->private_data = dev;
	return 0;
}

static int secbulk_release(struct inode *node, struct file *file)
{
	struct secbulk_dev *dev;

	dev = (struct secbulk_dev*)(file->private_data);
	kfree(dev->bulkout_buffer);
	mutex_unlock(&dev->io_mutex);
	return 0;
}

static struct file_operations secbulk_fops = {
	.owner 	=	THIS_MODULE,
	.read 	=	secbulk_read,
	.write	=	secbulk_write,
	.open   =	secbulk_open,
	.release=	secbulk_release,
};

static struct usb_class_driver secbulk_class = {
	.name = 	"secbulk%d",
	.fops =		&secbulk_fops,
	.minor_base=	100,
};

static int secbulk_probe(struct usb_interface *interface, const struct usb_device_id *id)
{
	int ret;
	struct secbulk_dev *dev;
	struct usb_host_interface *iface_desc;
	struct usb_endpoint_descriptor *endpoint;
	int i;

	printk(KERN_INFO "secbulk:secbulk probing...\n");
	
	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
	if(!dev)
	{
		ret = -ENOMEM;
		goto error;
	}	

	iface_desc = interface->cur_altsetting;
	for(i=0; i < iface_desc->desc.bNumEndpoints; i++)
	{
		endpoint = &(iface_desc->endpoint[i].desc);
		if(!dev->bulk_out_endpointAddr
		&& usb_endpoint_is_bulk_out(endpoint))
		{
			printk(KERN_INFO "secbulk:bulk out endpoint found!\n");
			dev->bulk_out_endpointAddr = endpoint->bEndpointAddress;
			break;
		}
	}
	
	if(!(dev->bulk_out_endpointAddr))
	{
		ret = -EBUSY;
		goto error;
	}

	ret = usb_register_dev(interface, &secbulk_class);
	if(ret)
	{
		printk(KERN_ERR "secbulk: usb_register_dev failed!\n");
		return ret;
	}		
	dev->udev = usb_get_dev(interface_to_usbdev(interface));

	usb_set_intfdata(interface, dev);
	
	mutex_init(&dev->io_mutex);
	return 0;
error:
	if(!dev)
		kfree(dev);
	return ret;
}

static struct usb_driver secbulk_driver= {
	.name=		"secbulk",
	.probe=		secbulk_probe,
	.disconnect=	secbulk_disconnect,
	.id_table=	secbulk_table,
	.supports_autosuspend=0,
};
static int __init secbulk_init(void)
{
	int result;
	printk(KERN_INFO "secbulk:secbulk loaded\n");
	result = usb_register(&secbulk_driver);
	if(result)
	{	printk(KERN_ERR "secbulk:usb_register failed: %d", result);
		return result;
	}		
	return 0;
}

static void __exit secbulk_exit(void)
{
	usb_deregister(&secbulk_driver);
	printk(KERN_INFO "secbulk:secbulk unloaded\n");
}

module_init(secbulk_init);
module_exit(secbulk_exit);
MODULE_LICENSE("GPL");
