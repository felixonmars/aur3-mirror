if [ -z $1 ] ; then
	echo "Usage: build-qubes-kernel kernel-version"
	exit
fi
kernelver=$1

sudo umount --lazy /lib/modules

echo "Running depmod..."
sudo depmod -a $kernelver

sudo mkinitcpio --config /usr/share/qubes/mkinitcpio.conf --kernel $kernelver -g /boot/initramfs-qubes.img

echo "Creating modules.img..."
sudo rm /boot/modules.img
sudo truncate -s 200M /boot/modules.img
sudo mkfs -t ext3 -F /boot/modules.img > /dev/null

echo "Copying kernel modules directory"
mkdir /tmp/kernelimg
sudo mount /boot/modules.img /tmp/kernelimg -o loop
sudo cp -r -a /lib/modules/*$kernelver* /tmp/kernelimg
sudo umount /tmp/kernelimg

echo "You can now copy /boot/initramfs-qubes.img and /boot/modules.img to your dom0"
