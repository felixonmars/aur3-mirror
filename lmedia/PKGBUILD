# Contributor: Lucas Hermann Negri <kkndrox@gmail.org>
# Maintainer: Laszlo Papp <djszapi @ archlinux us>

pkgname=lmedia
pkgver=0.3.0
pkgrel=2
pkgdesc="gstreamer bindings to Lua"
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org"
depends=('gstreamer0.10-base' 'lua>=5.1')
makedepends=('gcc')
license=(LGPL)
source=(http://download.tuxfamily.org/oproj/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('af6f2421e9543cf76f98f20142c04728')

build() {
	cd $srcdir/$pkgname-$pkgver
	make WITH_XOVERLAY=1 || return 1
	make install DESTDIR=$pkgdir || return 1
}
