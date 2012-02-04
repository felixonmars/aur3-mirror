# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mars-shooter
pkgver=0.7.4
pkgrel=1
pkgdesc="A ridiculous space shooter with nice graphics"
arch=(i686 x86_64)
url="http://mars-game.sourceforge.net/"
license=('GPL')
depends=('sfml' 'taglib' 'fribidi')
makedepends=('cmake')
source=(http://sourceforge.net/projects/mars-game/files/mars_source_${pkgver}.tar.gz)
md5sums=('59e0bdfbcc3f5f6a5fa422f6f849c3ae')

build() {
  cd "$srcdir/mars-game"

  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/mars-game"

  cd build

  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/share/games/marsshooter" "$pkgdir/usr/share/"
  mkdir -p "$pkgdir/usr/bin"
  mv "$pkgdir/usr/games/mars" "$pkgdir/usr/bin/"
  rm -r "$pkgdir/usr/games/"
  rm -r "$pkgdir/usr/share/games/"
}
