# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com
pkgname=python2-pyasn1
pkgver=0.1.6
pkgrel=1
pkgdesc="implementation of ASN.1 types and codecs in Python programming language"
arch=('any')
url="https://pypi.python.org/pypi/pyasn1"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pyasn1/pyasn1-$pkgver.tar.gz")
md5sums=()

build(){
  cd "$srcdir/pyasn1-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/pyasn1-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('e1851ac1123c50f134cc29420fd5e0bd')
