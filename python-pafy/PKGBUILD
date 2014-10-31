pkgname=python-pafy
pkgver=0.3.64
pkgrel=1

pkgdesc="Python API for YouTube"
url="http://np1.github.io/pafy"
arch=('any')
license=('GPL3')

depends=('python')

source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")

sha1sums=('53b2bab4f4eb06c6f623b2dd850172ec28a6c27f')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
