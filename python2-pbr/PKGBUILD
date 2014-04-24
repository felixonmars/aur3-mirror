# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: James Bulmer <nekinie@gmail.com>

pkgname="python2-pbr"
pkgver=0.8.0
pkgrel=1
pkgdesc="Python build reasonableness"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/pbr/"
license=("Apache")
depends=("python2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/pbr/pbr-${pkgver}.tar.gz")
md5sums=("7d85dc6aa47809d97d29901bf0244f6f")

build() {
  cd "${srcdir}/pbr-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pbr-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}