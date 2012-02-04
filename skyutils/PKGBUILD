# $Id: PKGBUILD,v 1.9 2006/05/27 16:55:53 andyrtr Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=skyutils
pkgver=2.8
pkgrel=1
pkgdesc="A library containing many usefull functions (chained lists, string manipulation, socket, and HTTP protocol)"
arch=(i686 x86_64)
license=('LGPL')
depends=('bash')
source=(http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('52eb7829b740acbda2e116e9350a765b')
url="http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/"

build() {
	cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
	# libtoolslay
	find $startdir/pkg -name '*.la' -exec rm {} \;
}
