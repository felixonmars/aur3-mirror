# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python2-execnet
pkgver=1.1
pkgrel=1
pkgdesc="rapid multi-Python deployment"
arch=('any')
license=('GPL')
url="http://codespeak.net/execnet"
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/e/execnet/execnet-$pkgver.zip")
sha256sums=('fa1d8bd6b6d2282ff4df474b8ac687e1775bff4fc6462b219a5f89d5e9e6908c')

package() {
  cd "${srcdir}/execnet-${pkgver}"

  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' execnet/script/shell.py
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' execnet/script/socketserver.py

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
