# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-pafy
pkgver=0.3.58
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")
sha256sums=('05e5c67d81b596baaf8c154bd5ea9a2b36f5b5048b251821809151ca16ade8d0')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
