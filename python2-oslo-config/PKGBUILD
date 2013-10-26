# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=python2-oslo-config
_pythonname=oslo.config
pkgver=1.2.1
pkgrel=1
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.python.org/pypi/oslo.config/1.1.0"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/o/$_pythonname/$_pythonname-$pkgver.tar.gz")
md5sums=('9ba2c7d74a19b16b5b6a33ec057d7eda')

build(){
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
