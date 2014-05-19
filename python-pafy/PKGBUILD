# Maintainer: Johannes Löthberg <johannes2kyriasis.com>

pkgname=python-pafy
pkgver=0.3.42
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")
sha256sums=('04bbcab4e427a14a939e1b8a0abc20872fa3cb779da4fac726144ab5b8a5e551')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
