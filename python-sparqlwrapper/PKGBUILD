# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python-sparqlwrapper
_pkgname=SPARQLWrapper
pkgver=1.5.0
pkgrel=1
pkgdesc="Helps in creating the query URI and convert the result into a more manageable format"
url="http://sparql-wrapper.sourceforge.net/"
license="W3C"
depends=('python')
optdepends=('rdflib' 'python-simplejson')
makedepends=('python2-distribute')
arch=('any')
source=("http://sourceforge.net/projects/sparql-wrapper/files/sparql-wrapper-python/$pkgver/$_pkgname-$pkgver.zip")
md5sums=('d6fe88fcd3cee9e897d1275dab5013ac')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
