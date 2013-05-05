# Maintainer: Alexej Magura <agm2819*gmail*>
#
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: James Rayner <james@archlinux.org>

pkgname=crimson
pkgver=0.5.3
pkgrel=2
pkgdesc="a tactical war game in the tradition of Battle Isle (turn-based)"
arch=(i686 x86_64)
url="http://crimson.seul.org"
license=("GPL")
depends=('sdl_mixer' 'sdl_ttf' 'sdl_net' 'gcc-libs')
source=(http://crimson.seul.org/files/$pkgname-${pkgver}.tar.bz2)
md5sums=(9e71bc8c12ddadf42136a3e07ae86a2c)

prepare() {
    cd $srcdir/$pkgname-$pkgver

    ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make 
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=$pkgdir install 

    make clean
}
