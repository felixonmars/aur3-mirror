# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
# Contributor: Miroslav Koskar (http://miroslavkoskar.com/)

_basename='trayer-srg'
_pkgbuildver=1

pkgname='trayer-srg-git'
pkgver=1.1.6.r17.gc61b606
pkgrel=1
pkgdesc='A trayer fork with multi monitor support, cleaned up codebase and other fancy stuff.'
url='http://github.com/sargon/trayer-srg'
license=('MIT')
arch=('i686' 'x86_64')
depends=('gtk2')
provides=('trayer-srg' 'trayer')
conflicts=('trayer-srg' 'trayer')
makedepends=('git')

source=("git+https://github.com/sargon/$_basename.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trayer-srg"
  git describe --long --tags | sed -r 's/^trayer-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_basename"
  ./configure
  make
}

package() {
  cd "$srcdir/$_basename"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 man/trayer.1 "$pkgdir/usr/share/man/man1/trayer.1"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

