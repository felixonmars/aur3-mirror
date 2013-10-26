# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com
_pythonname=python-quantumclient
pkgname=python2-quantumclient
pkgver=2.2.4.3
pkgrel=1
pkgdesc="CLI and python client library for OpenStack Quantum"
arch=('any')
url="https://pypi.python.org/pypi/$_pythonname"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_pythonname/$_pythonname-$pkgver.tar.gz")

build(){
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('d4db45d8e064bb5b155b3547ffc34cae')
