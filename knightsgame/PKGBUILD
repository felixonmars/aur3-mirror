# Maintainer: ikovac <ikovac at chammy dot info>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lauri Niskanen <ape@ape3000.com>

pkgname=knightsgame
pkgver=023
pkgrel=1
pkgdesc='Remake of the multiplayer action game originally released for Amiga in 1994.'
arch=('i686' 'x86_64')
url='http://www.knightsgame.org.uk/'
license=('GPL')
depends=('sdl' 'curl' 'fontconfig' 'boost-libs')
makedepends=('boost')
source=("http://www.knightsgame.org.uk/files/knights_${pkgver}_src.tar.gz")
md5sums=('12f47d35ba497400833e744e03d89376')

build() {
  cd knights_${pkgver}_src

  sed 's|-lboost_thread-mt|-lboost_thread -lboost_system -lrt|g' -i Makefile
  make PREFIX=/usr
}

package() {
  cd knights_${pkgver}_src

  make PREFIX=${pkgdir}/usr install
}
