# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=rpcd-git
_gitname=rpcd
pkgver=r113.b71df5b
# commit b71df5b75f9abb369cdcc69ba47297e5fbc17a64
pkgrel=1
pkgdesc='OpenWrt ubus RPC backend server'
url='http://nbd.name/gitweb.cgi?p=luci2/rpcd.git'
arch=('i686' 'x86_64')
license=('ISC')
depends=('libubox-lua-git' 'ubus-lua-git' 'uci-lua-git')
makedepends=('git' 'cmake' 'gcc' 'make')
conflicts=('rpcd')
provides=('rpcd')
source=('git://nbd.name/luci2/rpcd.git' '001-install-headers.patch' '002-rpcd-location.patch')
md5sums=('SKIP' 'afc1944b04042937e430f52d10e3e502' 'c0cde4bf001930e464b6f7fb7a5335f3')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	patch -p1 -i "$srcdir/001-install-headers.patch"
	patch -p1 -i "$srcdir/002-rpcd-location.patch"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DIWINFO_SUPPORT=NO

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install

	install -d "$pkgdir"/usr/lib/rpcd/
	mv "$pkgdir"/usr/lib/file.so "$pkgdir"/usr/lib/rpcd/
}

# burp -c daemons `ls rpcd-git*.src.tar.gz | sort | tail -n 1`
