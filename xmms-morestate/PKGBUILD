# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
pkgname=xmms-morestate
pkgver=1.2
pkgrel=1
pkgdesc="A status preservation and autoplay plugin for XMMS"
url="http://xmms-morestate.sf.net/"
depends=(xmms)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sourceforge.net/sourceforge/xmms-morestate/xmms-morestate-1.2.tar.gz)
md5sums=('5e827d50455899bfe87b72bf032681e0')

build()
{
	cd $startdir/src/$pkgname-$pkgver
	./configure 
	make || return 1
	mkdir -p $startdir/pkg/usr/lib/xmms/General
	cp libmorestate.so $startdir/pkg/usr/lib/xmms/General
}
