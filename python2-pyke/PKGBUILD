# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=python2-pyke
pkgver=1.1.1
pkgrel=1
pkgdesc='A knowledge-based inference engine written in 100% Python'
arch=('any')
url='http://pyke.sourceforge.net/'
license=('MIT')
depends=('python2')
makedepends=('setuptools')
source=("http://downloads.sourceforge.net/project/pyke/pyke/${pkgver}/pyke-${pkgver}.zip")
md5sums=('b0f9daa278d9996bc742277126831001')

build() {
  cd pyke-${pkgver}

  python2 setup.py build
}

package() {
  cd pyke-${pkgver}

  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
