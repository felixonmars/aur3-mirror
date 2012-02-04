# Contributor: Ryan Baumann <titegtnodI> <ti.teg.tnod.I@gmail.com>

pkgname=python3-notify
_pkgname=py-notify
pkgver=0.3.1
pkgrel=0
arch='any'
pkgdesc="Py-notify is a Python package providing tools for implementing Observer programming pattern."
depends=('python3')
license='LGPL'
url="http://home.gna.org/py-notify/"
source=("http://download.gna.org/py-notify/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b19d054d4aa8bd4648be315bf34a2394')
build() {
  cd "${srcdir}/${_pkgname}-$pkgver/"
  python3 setup.py install --root=${pkgdir}
}

