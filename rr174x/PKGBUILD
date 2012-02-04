# $Id: $
# Contributor: DDub <archlinux@dmz.me.uk> 

pkgname=rr174x
pkgver=1.02
pkgrel=1
pkgdesc="Proprietary -ARCH kernel drivers/modules for the Highpoint RocketRAID 1740 SATA card"
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA/bios_rr1740.htm"
license=('custom:"Proprietary"')
depends=('kernel26')
makedepends=()
install=$pkgname.install
source=(http://www.highpoint-tech.com/BIOS_Driver/rr1740/Linux/$pkgname-linux-src-$pkgver-070213-1031.tgz)
md5sums=('dff1ef6faaf286ee2a68e646d41b8a9a')
sha1sums=('4018ac4a39373a5564d59a916059575d68f1bbc4')

_kernver=2.6.21-ARCH

build() {
    cd $startdir/src/$pkgname-linux-src-$pkgver/product/$pkgname/linux/
     
    [ "$CARCH" = "x86_64" ] && _arch="ARCH=x86_64"

    make $_arch 

    mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/scsi/

    # Install the kernel module
    install -m 644 -D $startdir/src/$pkgname-linux-src-$pkgver/product/$pkgname/linux/.build/$pkgname.ko \
        $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/scsi/

    mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
    cp $startdir/src/$pkgname-linux-src-$pkgver/README $startdir/pkg/usr/share/licenses/$pkgname/
}
