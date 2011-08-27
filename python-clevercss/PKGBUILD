# Contributor: Alexandre Héaumé <alexandreheaume at gmail dot com>

pkgname=python-clevercss
_pkgname=CleverCSS
pkgver=0.1
pkgrel=5
pkgdesc="A small markup language for CSS inspired by Python"
arch=('i686' 'x86_64')
url="http://sandbox.pocoo.org/clevercss/"
license=('GPL')
depends=('python')
optdepends=()
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/C/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('7f425cccb6bca7c6603cddb652545e26')

build() {
	cd $srcdir/$_pkgname-$pkgver/
	python setup.py install --root=$startdir || return 1
}
