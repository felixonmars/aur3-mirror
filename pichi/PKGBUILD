# Maintainer: Amparo Dios <amparo.dios@gmail.com>
pkgname=pichi
pkgver=0.6.1
pkgrel=1
pkgdesc="Pichi is a jabber(xmpp) bot written in C++. It is based on the sulci abilities."
arch=(i686 x86_64)
url="http://code.google.com/p/pichi/"
license=('GPLv2')
depends=('curl' 'boost' 'sqlite3' 'gloox')
makedepends=('cmake' 'make')
source=(http://pichi.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('3a8c771e0648a29e17f842e2242a995d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release \
    -DLOCAL_TINYXML=ON 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

