# Maintainer: Konsta Kokkinen <kray@tsundere.fi>
pkgname=minetest
pkgver=0.4.5
pkgrel=0
pkgdesc='An Infiniminer/Minecraft inspired game'
arch=('i686' 'x86_64')
url='http://minetest.net/'
license=('GPL')
depends=('sqlite3' 'libgl' 'libxxf86vm' 'openal' 'libvorbis' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cmake' 'irrlicht' 'mesa' 'libpng' 'zlib')
conflicts=('minetest-hg' 'minetest-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/minetest/$pkgname/tarball/$pkgver
	${pkgname}_game-$pkgver.tar.gz::https://github.com/minetest/${pkgname}_game/tarball/$pkgver)
md5sums=('faaa77630e91b4fea12c38e588c89d84'
         '508387d2ed3e8ca30e64c3b01cfb9b35')

build() {
	cd "$srcdir"/minetest-minetest-*
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir"/minetest-minetest-*
	make DESTDIR="$pkgdir" install

	mv "$srcdir"/minetest-minetest_game-* "$pkgdir"/usr/share/minetest/games/minetest
}
