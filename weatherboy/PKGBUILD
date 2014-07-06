# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=weatherboy
pkgver=20140705
pkgrel=3
pkgdesc="Lightweight weather GTK tray application."
arch=('any')
url="https://github.com/decayofmind/weatherboy"
license=('GPL')
depends=(python2 gtk2)
makedepends=()
source=("$pkgname"::'git://github.com/decayofmind/weatherboy.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
  cd "$srcdir/$pkgname"
  install -D -m 0755 weatherboy.py "$pkgdir"/usr/bin/weatherboy
}
