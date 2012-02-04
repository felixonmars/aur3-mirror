# Contributor: <ahmad200512@yandex.ru>
pkgname=verlihub-plugins-lua
pkgver=1.8.1
pkgrel=1
pkgdesc="The Lua API for Verlihub DC++ hub"
arch=('i686' 'x86_64')
url="http://www.verlihub-project.org"
license=('GPL')
depends=('verlihub' 'lua')
replaces=('1c7f71106e6a0897b3ae99aa412ca680')
source=(http://www.verlihub-project.org/download/lua-${pkgver}.tar.gz)
md5sums=('1c7f71106e6a0897b3ae99aa412ca680')

build() {
	cd "$srcdir/lua-$pkgver"

	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR="$pkgdir" install
}
