# Maintainer: 404
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=gameandwatch
pkgver=0.3
pkgrel=2
pkgdesc="Simulator of Game & Watch games"
arch=('i686' 'x86_64')
url="http://www.rangelreale.com/programming/game-watch-simulator"
license=('GPL')
depends=('boost-libs' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'zziplib')
makedepends=('svn' 'boost')
install=gameandwatch.install
source=($pkgname-$pkgver::"svn+http://svn.code.sf.net/p/$pkgname/code/gamewatch/tags/rel-$pkgver"
        "$pkgname-build-fixes.patch")
sha256sums=('SKIP'
            'a017756728c929ea824e732ba67b4a96d24daaf9d80ee863b4bd1ab93fa56ebc')

prepare() {
  cd $pkgname-$pkgver

  # build fixes
  patch -Np1 < ../$pkgname-build-fixes.patch
}

build() {
  cd $pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
