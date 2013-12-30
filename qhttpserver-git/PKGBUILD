# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=qhttpserver-git
pkgver=99.9163383
pkgrel=1
pkgdesc="A Qt HTTP Server - because hard-core programmers write web-apps in C++ :)"
arch=('i686' 'x86_64')
url="https://github.com/nikhilm/qhttpserver"
license=('BSD')
depends=('qt4')
makedepends=('git')
source=(git+https://github.com/nikhilm/qhttpserver.git)
md5sums=('SKIP')

pkgver() {
  cd qhttpserver
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/qhttpserver"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/qhttpserver"
  mkdir -p "$pkgdir/usr/include"
  cp src/*.h "$pkgdir/usr/include/"
  cp -r lib "$pkgdir/usr/"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
