# Contributor: Angus Gibson <darthshrine@gmail.com>
pkgname=cfunge
pkgver=0.9.0
pkgrel=1
pkgdesc="A fast, small and standard conforming Befunge98 interpreter"
arch=(i686 x86_64)
url="http://rage.kuonet.org/~anmaster/cfunge/"
license=('GPL')
makedepends=(cmake)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('2cc525724168e6bd88f22825232b8092')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build && cd build

  cmake -D CMAKE_INSTALL_PREFIX:STRING=/usr ..
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
