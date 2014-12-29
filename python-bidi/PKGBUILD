# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=python-bidi
pkgver=0.3.4
pkgrel=1
pkgdesc="Bi-directional (BiDi) layout implementation in pure python"
arch=(any)
url="https://github.com/MeirKriheli/python-bidi"
license=('LGPLv3')
depends=('python')
source=("https://github.com/MeirKriheli/${pkgname}/archive/v${pkgver}.zip")
md5sums=('435df323612b7ec8c90fd0828d816ccd')

package() {
  cd "${srcdir}/python-bidi"-${pkgver}
  python setup.py install --root="${pkgdir}/"
}
