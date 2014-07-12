# Maintainer: Jon Nordby <jononor@gmail.com>
pkgname=fabmodules
pkgver=2014.06
pkgrel=2
pkgdesc="Fab modules allows you to control the machines in a Fablab (kokompe project)"
arch=('i686' 'x86_64')
url="http://kokompe.cba.mit.edu/"
license=('custom')
depends=('python2')
makedepends=('cmake')
optdepends=()
install=
source=(http://kokompe.cba.mit.edu/fab_src.zip
        0001-Fix-compilation-errors-when-using-giflib-5.patch)
md5sums=('487e04f3285ced9e1a4451fe2782b0fb'
         '22f6f5d0e97871ab348bbcf1a58ae097')

prepare() {
	cd "$srcdir/"
	patch -p1 -i "$srcdir/0001-Fix-compilation-errors-when-using-giflib-5.patch"
}

build() {
	cd "$srcdir/"
	make fab
    sed -i \
        -e "s|#!/usr/bin/python$|#!/usr/bin/python2|" \
        -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
        bin/*

}

package() {
	cd "$srcdir/"
    mkdir -p "$pkgdir/usr/bin/"
    cp -r bin/* "$pkgdir/usr/bin/"
}
