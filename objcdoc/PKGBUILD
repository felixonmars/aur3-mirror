# Contributor: Fred Morcos <fred.morcos@gmail.com>

pkgname=objcdoc
pkgver=3.0.0
pkgrel=1
pkgdesc="A tool for documenting Objective-C class libraries."
arch=('i686')
url="http://www.informatik.uos.de/elmar/projects/objcdoc/"
license=('GPL')
provides=('objcdoc')
source=("ftp://ftp.inf.uos.de/pub/elmar/objcdoc/$pkgname-$pkgver.tar.gz")
md5sums=('eb75ad47790e37bbad549b71485a9b98')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}

