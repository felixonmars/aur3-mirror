# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=lua-curl-git
_gitname=lua-curl
# commit 047ac31ecd18c2526eed84e349e5016de2633fac
pkgver=20140117
pkgrel=1
pkgdesc='Aiming for a full-fledged libcurl binding'
url='http://msva.github.io/lua-curl/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('lua51' 'curl')
source=('git://github.com/msva/lua-curl.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DLUA_INCLUDE_DIR="/usr/include/lua5.1" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_LUA=ON \

	make VERBOSE=1 \
		LUA=lua5.1 \
		CFLAGS="$(pkg-config --cflags lua5.1)" \
		LDFLAGS="$(pkg-config --libs lua5.1)"
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}
