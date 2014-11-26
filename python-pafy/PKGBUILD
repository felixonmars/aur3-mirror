pkgname=python-pafy
pkgver=0.3.66
pkgrel=2

pkgdesc="Python API for YouTube"
url="http://np1.github.io/pafy"
arch=('any')
license=('GPL3')

depends=('python')
optdepends=('ffmpeg: fix issues with audio file downloads')

source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")

sha1sums=('bdd097229443a4cec1226d5a428ac859e528be0d')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
