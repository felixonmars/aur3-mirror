# Maintainer: Malte Bublitz <me@malte-bublitz.de>

pkgname=python2-twoffein
pkgver=0.20121212
pkgrel=1
pkgdesc="A Python 2 module to access the Twoffein API easily."
arch=(any)
url="https://github.com/malte70/python-twoffein"
license=(BSD)
depends=(python2)
makedepends=("python2-distribute")
source=("ftp://ftp.malte-bublitz.de/pub/python-twoffein/Twoffein-${pkgver}.tar.gz")
md5sums=('030d7ec43357a39f3916c4a052724441')

package() {
	cd "${srcdir}/Twoffein-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
