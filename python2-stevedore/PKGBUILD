# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com
_pythonname=stevedore
pkgname=python2-stevedore
pkgver=0.8
pkgrel=1
pkgdesc="Manage dynamic plugins for Python applications"
arch=('any')
url="https://pypi.python.org/pypi/$_pythonname"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/$_pythonname/$_pythonname-$pkgver.tar.gz")

build(){
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('8f340230754c2d70e6e34bc6d8678048')
