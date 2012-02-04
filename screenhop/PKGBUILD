# PKGBUILD by ArcherSeven
# Maintainer: ArcherSeven / KittyKatt
# Module/coding by MoD
pkgname="screenhop"
pkgver=0.1
pkgrel=2
pkgdesc="GTK Module for moving GTK apps between X screens"
arch=('i686' 'x86_64')
url="http://archerseven.com/pkg"
license=('unknown')
depends=('gtk2')
source=(${url}/${pkgname}-${pkgver}.tar)
md5sums=('61ba9d4d150d668dd954291fd29ad9d3')
install=('screenhop.install')
build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p $pkgdir/usr/lib/gtk-2.0/modules

    make

    install libscreenhop.so $pkgdir/usr/lib/gtk-2.0/modules/

    cd $srcdir
    cp  ${pkgname}-${pkgver}/libscreenhop.so $pkgdir/usr/lib/gtk-2.0/modules/libscreenhop.so
}
