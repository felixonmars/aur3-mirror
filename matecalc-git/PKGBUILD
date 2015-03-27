# Maintainer: Wami <black.silver (at) hotmail (dot) it>

pkgname=matecalc-git
pkgrel=1
pkgver=mate.calc.1.8.0.r0.g5fa4c38
pkgdesc="Calculator for the Mate desktop environment"
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/mate-calc"
license=('LGPL' 'GPL')
depends=('gtk2' 'libxml2' 'libpng' 'freetype2' 'pixman' 'glib2' 'pango'
'gdk-pixbuf2' 'cairo' 'atk')
makedepends=('mate-common' 'yelp-tools' 'bison' 'flex')
provides=('mate-calc')
source=('mate-calc::git+https://github.com/mate-desktop/mate-calc#branch=master')
md5sums=('SKIP')
install=('.matecalc-git.install')

pkgver() {
    cd "mate-calc"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/mate-calc"
    ./autogen.sh --prefix="/usr"
}

package() {
    cd "$srcdir/mate-calc"
    make DESTDIR="$pkgdir/" install
}
