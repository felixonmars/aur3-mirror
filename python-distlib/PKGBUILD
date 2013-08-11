# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-distlib
pkgver=0.1.2
pkgrel=1
pkgdesc="Distribution utilities"
arch=(any)
url="https://bitbucket.org/vinay.sajip/distlib"
license=('BSD')
depends=()
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/d/distlib/distlib-${pkgver}.zip)
md5sums=('9e2bd43c670403a603f8a81f71a662a0')

package() {
   cd "${srcdir}/distlib-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
