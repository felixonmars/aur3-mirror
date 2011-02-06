# Contributor: Philipp Schmidt <philschmidt at gmx dot net>

pkgname=python-wsgiref
pkgver=0.1.2
pkgrel=2
pkgdesc="WSGI (PEP 333) Reference Library"
arch=('i686' 'x86_64')
url="http://cheeseshop.python.org/pypi/wsgiref"
license=('PSF or ZPL')
depends=('python')
makedepends=('unzip' 'setuptools')
source=("http://pypi.python.org/packages/source/w/wsgiref/wsgiref-$pkgver.zip")
md5sums=('29b146e6ebd0f9fb119fe321f7bcf6cb')

build() {
	cd "$srcdir/wsgiref-$pkgver"

	python setup.py install --root=$pkgdir
}
