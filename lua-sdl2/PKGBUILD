# Maintainer: <ascent@cock.li>
pkgname=lua-sdl2
pkgver=2.0.3
pkgrel=1
pkgdesc="SDL 2.0 binding for Lua"
arch=('x86_64' 'i686')
url="https://redmine.malikania.fr/project/luasdl2/wiki"
license=('ISC')
depends=('lua' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf')
makedepends=('cmake')
source=('https://redmine.malikania.fr/attachments/download/175/Lua-SDL2-2.0.3-1-source.tar.gz')
md5sums=('bdeb064cdd59c9f2ab1a4a7fdc5db64f')

build() {
	cd "$srcdir/Lua-SDL2-2.0.3-1-source"
	mkdir "_build_"
	cd "_build_"
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DWITH_LUAVER=52 \
		-DWITH_MIXER=On \
		-DWITH_TTF=On \
		-DWITH_NET=On \
		-DWITH_IMAGE=On
	make
}

package() {
	cd "$srcdir/Lua-SDL2-2.0.3-1-source/_build_"
	make DESTDIR="$pkgdir/" install
}
