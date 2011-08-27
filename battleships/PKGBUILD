pkgname=battleships
pkgver=0.1
pkgrel=1
pkgdesc="A simple multiplayer server/client battleships game"
arch=('any')
url="http://www.github.com/bluepeppers/battleships"
license=('GPL')
groups=()
depends=('python' 'pyqt')
makedepends=('cx_freeze')
source=("http://github.com/downloads/bluepeppers/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=("cd570609c5b1ea32c4efdd0b25e8e70b")

build() {
	cd $srcdir/$pkgname-$pkgver
	make make -e PREFIX=/usr DESTDIR=$pkgdir
} 
