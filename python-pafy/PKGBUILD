# Maintainer: Johannes Löthberg <johannes2kyriasis.com>

pkgname=python-pafy
pkgver=0.3.33
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=('https://github.com/np1/pafy/archive/v0.3.33.tar.gz')
md5sums=('5d95cae9ca60570d37a30e4a2671be37')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}

# vim: set ts=4 sts=4 sw=4 noet:
