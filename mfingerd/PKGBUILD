# Maintainer: Malte Bublitz <me@malte-bublitz.de>

pkgname=mfingerd
pkgver=0.20121209
pkgrel=1
pkgdesc="Simple finger service"
arch=(any)
url="https://github.com/malte70/mFingerd"
license=(BSD)
depends=(python2)
makedepends=("python2-distribute")
source=("https://github.com/downloads/malte70/mFingerd/mfingerd-0.20121209.tar.gz")

package() {
	cd "${srcdir}"/mfingerd-$pkgver
	sed '45d' setup.py > setup.py
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
md5sums=('a8099fbd91543d9d1ed97589b2a93cdc')
