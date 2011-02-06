# Contributor: Kévin Guilloy <kevin.guilloy@gmail.com>
pkgname=epiphany-game
pkgver=0.7.0
pkgrel=1
pkgdesc="Epiphany is a multiplatform clone of Boulderdash"
arch=('i686' 'x86_64')
url="http://epiphany.sourceforge.net/"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_image')
makedepends=('make' 'autoconf' 'automake')
source=('http://downloads.sourceforge.net/epiphany/epiphany-src-0.7.0.tar.gz')
md5sums=('953d24b550e8d44952ebd6c3025cb582')

build() {
    cd $startdir/src/epiphany-$pkgver
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
}
