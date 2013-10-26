# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=pianobooster
pkgver=0.6.4b
pkgrel=4
pkgdesc="A new way to learn the piano just by playing a game."
arch=('i686' 'x86_64')
url="http://pianobooster.sourceforge.net/"
license=('GPL3')
depends=('qt4')
makedepends=('cmake' 'libgl')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-src-$pkgver.tar.gz")
md5sums=('4c1c34a4b763e6108aa9668be7890696')

prepare() {
  cd $pkgname-src-$pkgver/build
  # remove unneeded flag
  sed -i '/mwindows/d' ../src/CMakeLists.txt
}

build() {
  cd $pkgname-src-$pkgver/build
  cmake ../src -DCMAKE_INSTALL_PREFIX=/usr \
               -DCMAKE_EXE_LINKER_FLAGS=" -lGL -lpthread"
  make
}

package() {
  cd $pkgname-src-$pkgver/build
  make DESTDIR="$pkgdir/" install

  # bigger and nicer icon
  install -Dm644 ../src/images/logo64x64.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
