# Maintainer: Johannes Löthberg <johannes2kyriasis.com>

pkgname=python-pafy
pkgver=0.3.36
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")
md5sums=('a8505f19f9d547fdd2da51089d36e6d0')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
