# Maintainer: Marius Kittelmann <mkaay@mkaay.de>
pkgname=rr268x
pkgver=1.9
pkgrel=1
pkgdesc="Kernel modules for Highpoint RocketRAID 2680 SATA/SAS Card."
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com/USA_new/cs-series_rr2600.htm"
license=('custom')
groups=()

depends=('linux')
makedepends=('linux-headers')

provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
source=(http://www.highpoint-tech.com/BIOS_Driver/rr26xx/RR268x/Linux/v1.8.12.0823/RR268x-Linux-Src-v1.9-120817-1639.tar.gz kernel36.patch)
noextract=()
md5sums=('07e9a6fa94ab70174ffba4a265718e66' '5c55064d3455c0afed20647d3cb84892')
_extramodules=extramodules-3.6-ARCH
_kernver=`cat /lib/modules/${_extramodules}/version`

build() {
    mkdir -p $startdir/pkg/lib/modules/${_extramodules}/

    cd $startdir/src/rr268x-linux-src-v$pkgver/
    patch -p1 -i $startdir/kernel36.patch

    cd product/rr2680/linux/
    make KERNELDIR=/usr/src/linux-$_kernver || return 1

    # Install the kernel module
    install -m 644 -D rr2680.ko "${pkgdir}/lib/modules/${_extramodules}/"
    gzip "${pkgdir}/lib/modules/${_extramodules}/rr2680.ko"

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/rr268x-linux-src-v$pkgver/README $pkgdir/usr/share/licenses/$pkgname/
}
 

