# Contributor: lp76 <l.peduto@gmail.com>
pkgname=termit
pkgver=2.9.6
pkgrel=1
pkgdesc="A terminal emulator based on the vte library. It includes tabs, bookmarks, and the ability to switch encodings"
arch=('i686' 'x86_64')
url="https://github.com/nonstop/termit/wiki/"
license=('GPL')
depends=('vte' 'lua')
makedepends=('cmake>=2.6.1')
source=(http://github.com/downloads/nonstop/termit/$pkgname-$pkgver.tar.bz2)
md5sums=('d4cbe71d6830854a1c2cf421a2dfbdc8')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

