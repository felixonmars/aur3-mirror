# Contributor: Alexandre Héaumé <alexandreheaume at gmail dot com>

pkgname=python3-clevercss
_pkgname=CleverCSS
pkgver=0.1
pkgrel=5
pkgdesc="A small markup language for CSS inspired by Python"
arch=('i686' 'x86_64')
url="http://sandbox.pocoo.org/clevercss/"
license=('GPL')
depends=('python3')
optdepends=()
makedepends=('python3-distribute')
source=("http://pypi.python.org/packages/source/C/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('7f425cccb6bca7c6603cddb652545e26')

build() {
	cd $srcdir/$_pkgname-$pkgver/
    2to3 --write clevercss.py
	python3 setup.py install --root=$startdir/pkg || return 1
}
