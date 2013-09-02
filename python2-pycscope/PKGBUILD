# Maintainer: Tocer Deng <tocer.deng@gmail>
pkgname=python2-pycscope
_real_name=pycscope
pkgver=1.2.1
pkgrel=2
pkgdesc="Cscope database generator for Python source code"
arch=('any')
url="https://github.com/portante/pycscope"
license=('GPL')
groups=()
depends=('python2')
makedepends=()
provides=('python-pycscope')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/p/pycscope/$_real_name-${pkgver}.tar.gz")
md5sums=('89f1e79dbd211d9f8d96881f2e92e1fc')

package() {
  cd "$srcdir/$_real_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
