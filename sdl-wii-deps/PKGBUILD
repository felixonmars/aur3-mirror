# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>
pkgname=sdl-wii-deps
pkgver=20091009
pkgrel=2
pkgdesc="SDL port for the Wii dependencies. (Sorry I wasn't able to make them into seperate packages maybe later)"
requires=(libogc devkitppc)
arch=(any)
url="http://code.google.com/p/sdl-wii"
license=('custom')
source=('http://sdl-wii.googlecode.com/files/SDL%20Wii%2010-09-2009.zip')
md5sums=('510dcc1e43fa2de616a7b6f14b681c6c')

build() {
	mkdir -p $pkgdir/opt/devkitpro;
	cp -r $srcdir/libogc $pkgdir/opt/devkitpro;
}
