# Maintainer: Alper Kanat <alperkanat@raptiye.org>

pkgname=rtl8188su-firmware
pkgver=2.6.0006.20100625
pkgrel=1
pkgdesc="Drivers for Realtek 8188SU wireless chipset"
license="GPL"
depends=('kernel26-headers')
source=("http://cl.ly/3b8l/RTL8191SU_usb_linux_v2.6.0006.20100625.zip")
arch=('i686')
url="http://www.realtek.com.tw/"
install="$pkgname.install"
md5sums=('fe0c1d99a07d1836cffee48e221a6fb1')

_kernver=`uname -r`

build() {
    # extracting the driver archive
    cd "$srcdir/rtl8712_8188_8191_8192SU_usb_linux_v2.6.0006.20100625/driver"
    tar zxvf rtl8712_8188_8191_8192SU_usb_linux_v2.6.6.0.20100625.tar.gz
    cd rtl8712_8188_8191_8192SU_usb_linux_v2.6.0006.20100625
    # compiling the driver
    make || return 1
    # installing the driver
    install -D -m644 8712u.ko $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/8712u.ko

    # Update kernel version in .install script
    sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" $startdir/$pkgname.install
} 

