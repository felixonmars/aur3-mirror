# Contributor: LoneWolf <lonewolf@xs4all.nl> 

pkgname=rr231x-0x
pkgver=2.1
pkgrel=3
pkgdesc="Kernel modules for Highpoint RocketRAID 230x and 231x SATA cards"
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA/bios_rr2300.htm"
license=('custom')
groups=()
depends=('kernel26')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=rr231x-0x.install
source=(http://www.highpoint-tech.com/BIOS_Driver/rr231x_00/Linux/rr231x_0x-linux-src-v$pkgver-121707-1318.tar.gz)
noextract=()
md5sums=('81512db952ac4b8f74bc0232288f6fb1')

_kernver=2.6.23-ARCH


# Note : pkgname should be rr231_0x , but using this name gives problems with the 2007.08 base installer

build() {
    mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/scsi/
    cd $startdir/src/rr231x_0x-linux-src-v$pkgver/product/rr2310pm/linux/

    make || return 1

    # Install the kernel module
    install -m 644 -D rr2310_00.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/scsi/

    mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
    cp $startdir/src/rr231x_0x-linux-src-v$pkgver/README $startdir/pkg/usr/share/licenses/$pkgname/
}
