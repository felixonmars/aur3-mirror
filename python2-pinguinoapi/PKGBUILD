# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

pkgname=python2-pinguinoapi
modulename=PinguinoAPI
pkgver="1.0"
pkgrel="0"
pkgdesc="Compile and program Pinguino boards with Python."
arch=("any")
url="https://bitbucket.org/YeisonEng/pinguinoapi/"
license=("BSD 3-Clause")
#depends=("pinguino-ide")
makedepends=("python2-setuptools")
source=("${modulename}-${pkgver}::https://pypi.python.org/packages/source/P/${modulename}/${modulename}-${pkgver}.tar.gz")

md5sums=('da935e63e55828e4652adaf81f50f4f1')

package() {
    cd ${srcdir}/${modulename}-${pkgver}
    python2 setup.py install --root=$pkgdir
}
