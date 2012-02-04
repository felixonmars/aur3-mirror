# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-lxml
_pkgname=python-lxml
pkgver=2.3
pkgrel=1
pkgdesc="Python binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
license=('BSD' 'GPL' 'custom')
url="http://www.codespeak.net/lxml"
depends=('python26' 'libxslt')
optdepends=("beautiful-soup: support for parsing not well formed HTML")
source=("http://www.codespeak.net/lxml/lxml-$pkgver.tgz")
md5sums=('a245a015fd59b63e220005f263e1682a')

package() {
 cd "$srcdir/lxml-$pkgver"
 python26 setup.py install --root="$pkgdir" --optimize=1
 for file in LICENSES.txt doc/licenses/BSD.txt doc/licenses/elementtree.txt; do
  install -Dm 644 $file "$pkgdir/usr/share/licenses/$pkgname/${file/*\/}"
 done
}
