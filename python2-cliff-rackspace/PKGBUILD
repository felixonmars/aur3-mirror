# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com
_pythonname=cliff-rackspace
pkgname=python2-$_pythonname
pkgver=0.1.1
pkgrel=1
pkgdesc="Rackspace Python cliff library extensions."
arch=('any')
url="https://pypi.python.org/pypi/$_pythonname"
license=('GPL')
depends=('python2' 'python2-cliff')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/c/$_pythonname/$_pythonname-$pkgver.tar.gz")

build(){
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$_pythonname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('6e1f0f939762555069b9c32bcad46cb1')
