# Contributor: Andrey Makar <lyykfi@gmail.com>

pkgname=gpacman
pkgver=0.0.12
pkgrel=1
pkgdesc="GTK package manager"
url="http://code.google.com/p/gpacman/"
license=("GPL")
arch=("i686" "x86_64")
depends=('pygtk' 'vte' 'sudo')
source=("http://gpacman.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=("cb9f2cf870cad1e5acaa4fbe1eb731cd")

build () {
	cd $startdir/src/$pkgname-$pkgver
	 python setup.py install --root=$startdir/pkg
}

