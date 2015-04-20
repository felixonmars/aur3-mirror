# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=ubox-git
_gitname=ubox
pkgver=r115.6fbafd7
# commit 6fbafd7d5b2835d00eb9d1684e7c6ccf907177b8
pkgrel=1
pkgdesc='OpenWrt system helper toolbox'
url='http://nbd.name/gitweb.cgi?p=luci2/ubox.git'
arch=('i686' 'x86_64')
license=('ISC BSD-3c')
depends=('json-c' 'libubox-lua-git' 'ubus-lua-git' 'uci-lua-git')
makedepends=('git' 'cmake' 'gcc' 'make' 'patch' 'pkg-config')
conflicts=('ubox')
provides=('ubox')
source=('git://nbd.name/luci2/ubox.git' '001-ubox-location.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-ubox-location.patch"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}

# burp -c system `ls ubox-git*.src.tar.gz | sort | tail -n 1`
