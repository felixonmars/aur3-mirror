# $Id$
# Maintainer:

_proj=lxml
pkgname="python-$_proj-docs"
pkgver=2.3.5
pkgrel=1
pkgdesc="HTML documentation for \"$_proj\" Python package"
arch=('any')
license=('BSD' 'custom')
url="http://lxml.de/"
source=(http://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz{,.asc})
sha1sums=('4fec0ca5054a8d6220d3dc7230a5066850192848'
          'd74ad6509a0048ea0e979985e12869f2e1126b78')

package() {
  cd "${srcdir}"/lxml-$pkgver
  
  local DOCDIR="$pkgdir/usr/share/doc/$_proj"
  mkdir -p "$DOCDIR"
  cp -r doc/html "$DOCDIR/"

  install -Dm644 LICENSES.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/elementtree.txt
}
