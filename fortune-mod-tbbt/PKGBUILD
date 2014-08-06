# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>
# Contributor: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=fortune-mod-tbbt
_pkgname=tbbt
pkgver=1
pkgrel=2
pkgdesc=" The Big Bang Theory fortune cookie file"
url="http://dl.dropbox.com"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=($_pkgname)
md5sums=('c3ef39fdd15319a084e65e323cafe336')

build() {
  cd "$srcdir"
  strfile $_pkgname $_pkgname.dat
}

package () {
  install -D -m644 $_pkgname $pkgdir/usr/share/fortune/$_pkgname
  install -D -m644 $_pkgname.dat $pkgdir/usr/share/fortune/$_pkgname.dat
}
