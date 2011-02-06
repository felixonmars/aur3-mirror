# Archlive <http://archlive-pkg.googlecode.com>

pkgname=fblogo
pkgver=0.5.2
pkgrel=1
pkgdesc="Creates images to substitute Linux boot logo"
url="http://freakzone.net/gordon/#fblogo"
provides=('fblogo')
depends=('libpng' 'zlib')
makedepends=()
source=(#http://freakzone.net/gordon/src/$pkgname-$pkgver.tar.gz"
	http://gentoo.channelx.biz/distfiles/$pkgname-$pkgver.tar.gz
	fblogo-0.5.2-cross.patch
	)
arch=(i686 x86_64)
license=('GPL2')

build () {
	cd $srcdir/$pkgname-$pkgver
	patch -Np0 -i ../fblogo-0.5.2-cross.patch
	make || return
	make DESTDIR=$pkgdir install || return 1
}