# Contributor: Abakus <java5 at arcor dot de>
pkgname=aimage
pkgver=3.2.5
pkgrel=1
pkgdesc="is a program to create aff-images"
arch=('i686' 'x86_64')
url="http://www.afflib.org"
license=('GPL')
depends=('afflib')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('07a11d653cdd1d7a5aefe4d99cdbd408')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

