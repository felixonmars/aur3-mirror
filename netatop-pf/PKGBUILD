# Contributor: Spider.007 <archPackage@spider007.net>
pkgname=netatop-pf
pkgver=0.3
pkgrel=2
_kernel_ver=`uname -r`
_extramodules=extramodules-${_kernel_ver%.*}-pf
pkgdesc="Atop network kernel module, enables network statistics in atop"
url="http://www.atoptool.nl/"
groups=modules
license='GPL'
install='depmod.install'
depends=('atop' 'linux-pf')
makedepends=('linux-pf-headers')
conflicts=('netatop')
source=("http://atoptool.nl/download/netatop-$pkgver.tar.gz")
md5sums=('b8c3785571c1b35ff3c21d49d51283d4')
arch=('x86_64' 'i386')

build() {
    cd $srcdir/${pkgname%%-*}-$pkgver
    make all
}

package() {
    cd $srcdir/${pkgname%%-*}-$pkgver
    install -Dm 0744 module/netatop.ko $pkgdir/lib/modules/${_extramodules}/netatop.ko

    install -D daemon/netatopd $pkgdir/usr/bin/netatopd

    install -D man/netatop.4 $pkgdir/usr/share/man/man4/netatop.4
    install -D man/netatopd.8 $pkgdir/usr/share/man/man8/netatopd.8

    mkdir -p $pkgdir/etc/modules-load.d

    echo "netatop" > $pkgdir/etc/modules-load.d/netatop.conf
}
