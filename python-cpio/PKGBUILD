# Contributor: Penguin <TGates81.at.gmail.dot.com>

pkgname=python-cpio
pkgver=0.1
pkgrel=1
pkgdesc="A Python module for accessing cpio archives"
url="http://developer.berlios.de/projects/python-cpio"
license="LGPL"
depends=('python')
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('277934c8aa149dfa2714d70a68fe363d')

build() {
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --root=$startdir/pkg
}
