# $Id: PKGBUILD,v 1.5 2006/05/24 18:31:40 notz Exp $
# Maintainer: arjan <arjan@archlinux.org>
# Distributor : Markus Meissner <markus@meissna.de>

pkgname=libping
pkgver=1.25
pkgrel=2
pkgdesc='A library for implenting ping functions'
arch=(i686 x86_64)
license=('GPL')
backup=()
source=(ftp://sid.joedog.org/pub/libping/libping-latest.tar.gz)
md5sums=('9daa88ae9dc6c17b45180f5fe802acc2')
depends=()
url="http://www.joedog.org/libping/index.shtml"

build() {
	cd $startdir/src/li*
	./configure --prefix=/usr
	make
	make prefix=$startdir/pkg/usr install
	mkdir $startdir/pkg/usr/include
	cd $startdir/src/libping-1.15/include
	cp ping.h $startdir/pkg/usr/include
	cp config.h $startdir/pkg/usr/include
	find $startdir/pkg -name '*.la' -exec rm {} \;
}
