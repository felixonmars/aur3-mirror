#! /bin/sh -e
# TODO: Check for SYSLINUX.
# is_path_readable_by_grub:  Pass it a path.
# prepare_grub_to_access_device:  Pass it a device ...  Sets root.
# make_system_path_relative_to_its_root:  Includes leading slash.  Return value should be prefixed by a device.
#
# prepare_grub_to_access_device `${grub_probe} --target=device FFF`
#   Loads modules.
#   Sets root.

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib

. ${libdir}/grub/grub-mkconfig_lib

MEMDISK_IMAGE="/usr/lib/syslinux/memdisk"
HDAT2_IMAGE="/boot/hdat2all.img"
CLASS="--class memdisk --class hdat2 --class tool"

if [ -e $MEMDISK_IMAGE ] &&
   [ -e $HDAT2_IMAGE ] &&
   is_path_readable_by_grub $MEMDISK_IMAGE &&
   is_path_readable_by_grub $HDAT2_IMAGE
then
	echo "Found MEMDISK and HDAT2 images: $MEMDISK_IMAGE, $HDAT2_IMAGE" >&2

	cat << EOF
menuentry "HDAT2" $CLASS {
EOF
	prepare_grub_to_access_device `${grub_probe} --target=device $MEMDISK_IMAGE` | sed -e "s/^/\t/"
	cat << EOF
	linux16 (\$root)`make_system_path_relative_to_its_root $MEMDISK_IMAGE`
EOF

	prepare_grub_to_access_device `${grub_probe} --target=device $HDAT2_IMAGE` | sed -e "s/^/\t/"
	cat << EOF
	initrd16 (\$root)`make_system_path_relative_to_its_root $HDAT2_IMAGE`
}
EOF
fi
