# Contributor: Steven Allen <steven {at} stebalien {dot} com>

_pkgname="xssstate"
pkgname="$_pkgname-git"
pkgver=10
pkgrel=1
pkgdesc="A simple tool to retrieve the X screensaver state"
url='http://tools.suckless.org/xssstate'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxss' 'sh')
makedepends=('git')
provides=('xssstate')
conflicts=('xssstate')
source=("git://git.suckless.org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/doc/xssstate"
  install -m644 README xsidle.sh "$pkgdir/usr/share/doc/xssstate/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
