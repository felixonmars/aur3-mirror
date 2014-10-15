# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

pkgname=python2-pynguino
_pkgname=Pynguino
pkgver=2.0
pkgrel=10
pkgdesc="Easy interface Pinguino-Python"
arch=("any")
url="https://bitbucket.org/YeisonEng/pynguino-2.0/"
license=("BSD 3-Clause")
depends=("python2" "python2-pyserial" "python2-pyusb")
optdepends=("pinguino-ide")
makedepends=("python2-setuptools")
source=("${_pkgname}-${pkgver}.${pkgrel}::https://pypi.python.org/packages/source/P/Pynguino/Pynguino-${pkgver}.${pkgrel}.tar.gz")
md5sums=('a4b668dff87b15c2ff81865bf430eff2')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}.${pkgrel}
    python2 setup.py install --root=$pkgdir
}
