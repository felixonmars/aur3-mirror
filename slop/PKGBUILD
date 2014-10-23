# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=slop
pkgver="v3.1.9"
_vlessversion=${pkgver:1:${#pkgver}}
pkgrel=1
conflicts=( 'slop' )
pkgdesc="slop (Select Operation) is an application that queries for a selection from the user and prints the region to stdout."
arch=( 'i686' 'x86_64' )
url="https://github.com/naelstrof/$pkgname"
license=( 'GPL3' )
depends=( 'libxext' 'libx11' )
makedepends=( 'make' 'cmake' 'gcc' )
source=( "https://github.com/naelstrof/slop/archive/${pkgver}.tar.gz" )
md5sums=('92b0d2e511d0c7de6be513b3d29af480')

build() {
    cd "$srcdir/$pkgname-$_vlessversion"
    cmake ./
    make
}

package() {
    cd "$srcdir/$pkgname-$_vlessversion"

    make DESTDIR="${pkgdir}" install
}
