# Contributor: Vojtěch Aschenbrenner <v@asch.cz>
# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=python2-qrplatba
pkgver=0.3.4
pkgrel=1
pkgdesc="QR platba SVG QR code and SPAYD string generator"
arch=('any')
url="https://github.com/hareevs/python-qrplatba"
license=('MPL')
depends=('python2' 'python2-six' 'python2-qrcode')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/q/qrplatba/qrplatba-${pkgver}.tar.gz)
sha512sums=('f44332df49a758ab7e73ba19f60222cae7c2270e32f862e25918f901ff66b6e041f31fc0fec0f3163b909e6ee861aa150ff5a682bb3c063fe0be999d5d702a89')

package() {
  cd "$srcdir/qrplatba-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
