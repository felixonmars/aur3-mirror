# Maintainer: Johannes Löthberg <johannes2kyriasis.com>

pkgname=python-pafy
pkgver=0.3.44
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")
sha256sums=('4ff2769b7d9f0a4a31a55484c6dde83b6d01a841f843b6d995492df60850da10')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
