# Maintainer: Johannes Löthberg <johannes2kyriasis.com>

pkgname=python-pafy
pkgver=0.3.39
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")
md5sums=('c8f38d53c1b7d30ddd652f59972178dc')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
