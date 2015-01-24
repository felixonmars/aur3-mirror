pkgname=python-pafy
pkgver=0.3.68
pkgrel=1

pkgdesc="Python API for YouTube"
url="http://np1.github.io/pafy"
arch=('any')
license=('GPL3')

depends=('python')
optdepends=('ffmpeg: fix issues with audio file downloads')

source=("https://github.com/np1/pafy/archive/v$pkgver.tar.gz")

sha1sums=('727466219e7fbde1bc947616ec08238b8065bc86')

package() {
	cd pafy-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
