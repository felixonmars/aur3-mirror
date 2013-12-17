# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=weatherboy
pkgver=20120606
pkgrel=2
pkgdesc="Lightweight weather GTK tray application."
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?pid=995618"
license=('GPL')
depends=(python2 gtk2)
makedepends=()
source=(https://raw.github.com/decayofmind/weatherboy/master/"$pkgname".py)
md5sums=('58e0b23b90a33bb26b86725175b412cb')

package () {
  cd "$srcdir"
  install -D -m 0755 weatherboy.py "$pkgdir"/usr/bin/weatherboy
}
