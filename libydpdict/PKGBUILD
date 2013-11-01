# Maintainer: jurmc <jurmc@jurmc.mydevil.net>
# Contributor: Piotr Kujawski <piotr@lao.pl>

pkgname=libydpdict
pkgver=1.0.3
pkgrel=1
pkgdesc="Interface for Polish-English Collins Dictionary (library)"
url="http://toxygen.net/ydpdict"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
groups=office
source=(http://toxygen.net/ydpdict/$pkgname-$pkgver.tar.gz)
md5sums=('d4bace7d4c41344269e0913625e66c3f')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
