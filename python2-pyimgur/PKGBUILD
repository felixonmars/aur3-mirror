# Maintainer: Evan Pitstick <nerdx00+ARCH AT GMAIL DAT COM>

pkgname=python2-pyimgur
pkgver=0.5.2
pkgrel=2
pkgdesc="Upload images, download images, read comments, update your albums, message people, and more on imgur"
arch=(any)
url="http://pypi.python.org/pypi/pyimgur"
license=('GPLv3')
depends=(
	'python2'
	'python2-requests'
)
source=("http://pypi.python.org/packages/source/p/pyimgur/pyimgur-$pkgver.tar.gz")
md5sums=('d86ab19e440bdf05eaf89588f2b9ea66')

build() {
	cd "$srcdir/pyimgur-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/pyimgur-$pkgver"
	python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set sts=4 ts=4 sw=4 noet:
