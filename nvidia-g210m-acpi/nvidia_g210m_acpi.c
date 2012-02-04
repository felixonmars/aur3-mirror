/*
 * Linux kernel module that disables the discrete graphics board
 *
 * Original version for Lenovo laptops by Sylvain Joyeux <sylvain.joyeux@m4x.org> Copyright (c) 2009
 *
 * mil2 added nVidia GeForce G210M support (for Asus UL30VT, UL50V, UL80V laptops)
 * o8x8 added post hibernate support
 *
 * Marco Giorgi <blackmoon.105@gmail.com> packaged this module for debian/ubuntu
 *
 * Power down the nVidia card to save up to 4W of power.
 *
 */


/* 
 *  Name: nvidia_g210m_acpi.c
 *  Source code for nvidia_g210m_acpi switch-off kernel module
 *
 *  Licensed under the GNU GPL
 *
 */


#include <acpi/acpi.h>
#include <linux/suspend.h>
#include <linux/module.h>

MODULE_LICENSE( "GPL" );

static acpi_handle root_handle;

static int kill_nvidia(void)
{
    acpi_status status;
    // The device handle
    acpi_handle handle;
    struct acpi_object_list args;
    // For the return value
    struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };

    status = acpi_get_handle(root_handle, "\\_SB.PCI0.P0P1.VGA._OFF", &handle);
    if (ACPI_FAILURE(status))
    {
	printk("%s: cannot get ACPI handle: %s\n", __func__, acpi_format_exception(status));
	return -ENOSYS;
    }

    args.count = 0;
    args.pointer = NULL;

    status = acpi_evaluate_object(handle, NULL, &args, &buffer);
    if (ACPI_FAILURE(status))
    {
	printk("%s: _OFF method call failed: %s\n", __func__, acpi_format_exception(status));
	return -ENOSYS;
    }
    kfree(buffer.pointer);

    printk("%s: disabled the discrete graphics card\n", __func__);
    return 0;
}

static int power_event(struct notifier_block *this, unsigned long event, void *ptr)
{
    switch (event) {
	case PM_POST_HIBERNATION:
        printk("%s: post hibernation\n",__FILE__);
	    kill_nvidia();
        break;
	case PM_POST_SUSPEND:
        printk("%s: post suspend\n",__FILE__);
	    kill_nvidia();
	    break;
	default:
        break;
    }
    return NOTIFY_DONE;
}

static struct notifier_block power_notifier = { .notifier_call = power_event, };

static int __init nvidia_g210m_acpi(void)
{
    int ret = register_pm_notifier(&power_notifier);
    if (ret) return ret;
    return kill_nvidia();
}

static void dummy(void)
{
}

module_init(nvidia_g210m_acpi);
module_exit(dummy);
