# Contributor: Penguin <TGates81.at.gmail.dot.com>

pkgname=pylzma
pkgver=0.4.4
pkgrel=1
pkgdesc="Platform independent python bindings for the LZMA compression library"
url="http://www.joachim-bauch.de/projects/python/pylzma"
license="LGPL"
arch=(i686 x86_64)
depends=('python2' 'libstdc++5')
source=(http://pypi.python.org/packages/source/p/pylzma/$pkgname-$pkgver.tar.gz)
md5sums=('a2be89cb2288174ebb18bec68fa559fb')

build() {
	cd $startdir/src/$pkgname-$pkgver
	python2 setup.py install --root=$startdir/pkg
}

