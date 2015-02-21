# Maintainer: Nils Werner <nils.werner@gmail.com>
pkgname=python-rpio
pkgver=0.10.0
pkgrel=2
pkgdesc="RPIO is a python library to access GPIO pins on a Raspberry Pi."
url="https://pypi.python.org/pypi/RPIO"
arch=('armv6h')
license=('MIT')
depends=('python3' 'python-distribute')
optdepends=()
makedepends=()
conflicts=()
replaces=('rpio')
backup=()
install=
source=("https://github.com/metachris/RPIO/archive/a909894270885e9489d46677afe40eef4e702fe2.zip")
md5sums=('2c3b76a7f15b9c9641afe7d75c5bbdeb')

build() {
  cd "${srcdir}/RPIO-a909894270885e9489d46677afe40eef4e702fe2"
  python setup.py build
}

package() {
  cd "${srcdir}/RPIO-a909894270885e9489d46677afe40eef4e702fe2"
  python setup.py install --root="${pkgdir}"
}
