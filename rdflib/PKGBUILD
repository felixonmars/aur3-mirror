# Contributor: Leif Warner <abimelech@gmail.com>

pkgname=rdflib
pkgver=3.1.0
pkgrel=1
pkgdesc="A Python library for working with RDF, a simple yet powerful language for representing information"
url="http://rdflib.net/"
license="BSD"
depends=('python2')
makedepends=('python2-distribute')
arch=('any')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha1sums=('bbef5011fcd9cfa296a8ef33ac2885416b97da2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
