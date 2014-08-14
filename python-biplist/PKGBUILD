# Maintainer: minder <dominik at kozaczko dot info>

pkgname=python-biplist
_pkgname=biplist
pkgver=0.7
pkgrel=1
pkgdesc="A Python library to aid in implementing HTTP Digest Authentication."
arch=(any)
url="https://github.com/wooster/biplist"
source=("http://pypi.python.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
license=('BSD')
depends=('python>=3.2' 'python-nose')
optdepends=()
provides=()
conflicts=()
md5sums=("ebf8486edac5c73d2763858e0f71a2e8")


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir"
}
