# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=kopete-indicator
_pkgname=kopete-message-indicator
pkgver=0.2.1
pkgrel=1
pkgdesc="A plugin for Kopete which makes it possible to show activity in the Message Indicator"
arch=('i686' 'x86_64')
url="https://launchpad.net/kopete-message-indicator"
license=('GPL')
depends=('kdenetwork-kopete' 'libindicate-qt')
makedepends=('cmake>=2.6' 'automoc4')
source=(http://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2)
md5sums=('6c9f9bc7bfdfcf0e013fe4ffb722f54d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

