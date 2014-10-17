# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Steven Stebalien <steven@stebalien.com>
# Contributor: Tyler H. <htyler@pdx.edu>

pkgname=sind-git
pkgver=0.1.r4.gaeecca0
pkgrel=1
pkgdesc="Simple textbased notification daemon"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/htylo/simplenotifydaemon"
license=('MIT')
depends=('dbus')
makedepends=('git')
source=("$pkgname::git+https://github.com/htylo/simplenotifydaemon.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
  cd "$srcdir/$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir"
}
 
package() {
  cd "$srcdir/$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 "license" "$pkgdir/usr/share/licenses/$pkgname/license"
}