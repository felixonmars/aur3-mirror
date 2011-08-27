# Contributor: Maciej Ciemborowicz <moonkey@op.pl>
pkgname=alsamixer-qt4
pkgver=0.6.0
pkgrel=1
pkgdesc="QT frontend to alsamixer"
arch=('i686' 'x86_64')
options=('')
url="http://sourceforge.net/projects/alsamixer-qt4/"
license=('GPL')
depends=('qt')
makedepends=('cmake')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz/download)

build() {
	
	cd ${startdir}/pkg
	mkdir usr/
	mkdir usr/bin
	
cd $srcdir/$pkgname-$pkgver/
cmake .
make
install -Dm755 src/alsamixer-qt4 $pkgdir/usr/bin/alsamixer-qt4

}



md5sums=('a858979396f43db8c384cd17fa6f2c26')
