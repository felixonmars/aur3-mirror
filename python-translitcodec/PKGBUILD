# Contributor: Philipp Schmidt <philschmidt at gmx dot net>

pkgname=python-translitcodec
pkgver=0.1
pkgrel=1
pkgdesc="Unicode to 8-bit charset transliteration codec"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/translitcodec/"
license=('MIT')
depends=('python')
makedepends=('unzip' 'setuptools')
source=("http://pypi.python.org/packages/source/t/translitcodec/translitcodec-$pkgver.zip")
md5sums=('d1cfe258a77371d2fd4e5db9d16f973e')


build() {
	cd "$srcdir/translitcodec-$pkgver"

	python setup.py install --root=$pkgdir
}
