# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=pbar
pkgname=pidgin-$_pkg
pkgver=0.2
pkgrel=1
pkgdesc="A Pidgin plugin that adds a toolbar to the buddy list to quickly update nickname, personal message, icon, status, and mood."
arch=(i686 x86_64)
url="http://www.hauweele.net/~gawen/pidgin-pbar.html"
license=('GPL')
depends=('pidgin')
source=("https://github.com/downloads/gawen947/$pkgname/$_pkg-$pkgver.tar.bz2")
md5sums=('97963c858a995ae3763847329ea5fa46')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
