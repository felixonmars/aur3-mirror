# Maintainer: qpalz <kelvin9302104 at gmail dot com>

pkgname=wxformbuilder-bin
pkgver=3.1.70
pkgrel=2
pkgdesc="wxWidgets Designer, GUI Builder, and RAD Tool"
arch=('i686' 'x86_64')
url="http://wxformbuilder.org/"
license=("GPL")
depends=('wxgtk')
makedepends=()
provides=('wxformbuilder')
conflicts=('wxformbuilder')
if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    md5sums=('b058b41acc0b39e904f21c87d26f1b78')
else
    _arch='amd64'
    md5sums=('800bb26d45799f0b1aa5ca8509b9a169')
fi

source=("http://downloads.sourceforge.net/project/wxformbuilder/wxformbuilder/${pkgver}/wxformbuilder_${pkgver}-${_arch}.tar.bz2")

build() {
    cd $srcdir/wxformbuilder
    mkdir $pkgdir/usr
    cp -R bin $pkgdir/usr
    cp -R lib $pkgdir/usr
    cp -R share $pkgdir/usr
}
