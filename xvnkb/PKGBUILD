# Maintainer: Truong Xuan Tinh <tinh.truong@evolus.vn>
# Contributor: kyanh <kyanh@gmail.com>
pkgname=xvnkb
pkgver=0.2.11
pkgrel=1
pkgdesc="Vietnamese Keyboard"
arch=('any')
license=('GPL')
url="http://xvnkb.sf.net/"
source=(http://xvnkb.sourceforge.net/$pkgname-$pkgver.tar.bz2)
depends=('libxft')
md5sums=('48367859bb66dbab363989c8becf041d')
install=${pkgname}.install

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	make || return 1
	install -Dm755 xvnkb "$pkgdir/usr/bin/xvnkb"
	install -Dm755 tools/xvnkb_ctrl "$pkgdir/usr/bin/xvnkb_ctrl"
	install -Dm755 xvnkb.so.$pkgver "$pkgdir/usr/lib/xvnkb.so.$pkgver"
	ln -sf xvnkb.so.$pkgver "$pkgdir/usr/lib/xvnkb.so"
}
