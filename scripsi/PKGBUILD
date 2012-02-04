# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=scripsi
pkgver=0.3
pkgrel=1
pkgdesc="scripsi is a dual pane text editor designed to help translate documents."
url="http://www.jezra.net/projects/scripsi"
#groups=()
depends=('gtk2')
makedepends=('gcc' 'make' 'intltool' 'pkgconfig')
license="GPL"
source=(http://launchpad.net/$pkgname/1.0/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('609398ec6ed435b955950de28d9ae0ca')
arch=('i686' 'x86_64')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr/
	make || return 1
	make DESTDIR=$pkgdir install
}
