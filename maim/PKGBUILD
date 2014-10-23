# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=maim
pkgver="v2.3.30"
_vlessversion=${pkgver:1:${#pkgver}}
pkgrel=2
pkgdesc="maim (make image) makes an image out of the given area on the given X screen. Defaults to the whole screen."
arch=( 'i686' 'x86_64' )
url="https://github.com/naelstrof/$pkgname"
license=( 'GPL3' )
depends=( 'bzip2' 'freetype2' 'glibc' 'imlib2' 'libx11' 'libxext' 'zlib' 'libxfixes' 'libxrandr' )
makedepends=( 'make' 'gcc' 'cmake' )
optdepends=( 'slop: selection support' )
source=( "https://github.com/naelstrof/maim/archive/${pkgver}.tar.gz" )
md5sums=('61e13734d0d8aef6bba3da1c516b1d09')

build() {
    cd "$srcdir/$pkgname-$_vlessversion"
    cmake ./
    make
}

package() {
    cd "$srcdir/$pkgname-$_vlessversion"

    make DESTDIR="${pkgdir}" install
}
