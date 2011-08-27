# Contributor: jshantih <jshantih@gmail.com> 

pkgname=rr232x
pkgver=1.10
pkgrel=1
pkgdesc="Kernel module for Highpoint RocketRAID 232x SATA cards"
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA/bios_rr2320.htm"
license=('custom')
groups=()
depends=('kernel26>=2.6.31')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=rr232x.install
source=("http://www.support-highpoint-tech.com/Main/rr232x/Linux/opensrc/rr232x-linux-src-v$pkgver-090716-0928.tar.gz")
md5sums=('ff93a9237ce6c95bc0b44aaf267f01fc')
noextract=()

_kernver=2.6.31-ARCH

build() {
    mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/scsi/
    #patch -p0 < rr232x-2.6.30.patch
    cd $startdir/src/rr232x-linux-src-v$pkgver/product/rr232x/linux/

    KERNELDIR=/lib/modules/${_kernver}/build make || return 1

    # Install the kernel module
    install -m 644 -D rr232x.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/scsi/

    mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
    cp $startdir/src/rr232x-linux-src-v$pkgver/README $startdir/pkg/usr/share/licenses/$pkgname/
}
