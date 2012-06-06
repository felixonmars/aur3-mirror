# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=weatherboy
pkgver=20120606
pkgrel=1
pkgdesc="Lightweight weather GTK tray application."
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?pid=995618"
license=('GPL')
depends=(python2 gtk2)
makedepends=()
source=(http://heap.zloduch.cz/software/scripts/$pkgname)
md5sums=('4614c3fb13910ba999d6d5f4c50aed21')

package () {
  cd "$srcdir"
  install -D -m 0755 weatherboy "$pkgdir"/usr/bin/weatherboy
}
