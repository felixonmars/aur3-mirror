pkgname=python-pafy
pkgver=0.3.62
pkgrel=1

pkgdesc="Python API for YouTube - Download videos and retrieve metadata."
url="http://np1.github.io/pafy"
arch=('any')
license=('GPL3')

depends=('python')

source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")

sha256sums=('48eba571074dbe79814a5028b8ad0a2403ead5d226969cf8666585079e910fb4')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
