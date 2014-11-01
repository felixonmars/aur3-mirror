# Maintainer: Petar Koretic <petar.koretic@sartura.hr>
pkgname=ubus-git
_gitname=ubus
pkgver=205
pkgrel=1
pkgdesc="An embedded bus system developed for OpenWrt. It's like dbus but simple and small."
arch=('x86_64' 'i686')
url="http://openwrt.org"
license=('LGPL2')
depends=('libubox' 'json-c')
makedepends=('git' 'cmake' 'gcc' 'make')
optdepends=()
provides=('ubus-git')
conflicts=('ubus')
source=("$pkgname"::'git://nbd.name/luci2/ubus.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	echo `git rev-list --count HEAD`
}

build() {
	cd "$srcdir/$pkgname"
	cmake ./ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_LUA=OFF \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_EXAMPLES=OFF
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
