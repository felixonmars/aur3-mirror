# Author: Olivier Biesmans <olivier at biesmans dot fr>
_pypkg=PyAMF
_python=python2
pkgname=python2-${_pypkg,,}
pkgver=0.6.1
pkgrel=1
pkgdesc="PyAMF provides Action Message Format (AMF) support for Python"
arch=('any')
url="http://www.pyamf.org"
license=('MIT')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/P/PyAMF/PyAMF-${pkgver}.tar.gz")
sha256sums=('d8affca77466289eb77eac408e444c7e0787c1d75133628c1461d06bc5538396')

package() {
  cd "$srcdir/${_pypkg}-$pkgver"
  $_python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
