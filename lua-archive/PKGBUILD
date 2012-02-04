# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lua-archive
pkgver=0
pkgrel=1
pkgdesc="Lua libarchive integration."
arch=('i686' 'x86_64')
url="http://github.com/brimworks/lua-archive/"
license=('MIT')
depends=('lua')
makedepends=('cmake')
conflicts=('lua-archive-git')
source=("http://download.github.com/brimworks-lua-archive-cd6e2e4.tar.gz"
	"LICENSE")
md5sums=('621491191c6de41cbe72c59994f15919'
	 '838c366f69b72c5df05c96dff79b35f2')

build() {
	cd ${srcdir}/brimworks-lua-archive-cd6e2e4
	sed -i 's|share/lua/cmod|lib/lua/5.1|' CMakeLists.txt
	cmake . -DCMAKE_INSTALL_PREFIX="/usr" || return 1
	make || return 1
}

package() {
	cd ${srcdir}/brimworks-lua-archive-cd6e2e4
	make DESTDIR=${pkgdir} install || return 1
	install -Dm644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
