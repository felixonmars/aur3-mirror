# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: perlawk

pkgname=tekui
pkgver=1.12
pkgrel=3
pkgdesc="A small, freestanding and portable GUI toolkit written in Lua and C."
arch=('i686' 'x86_64')
url="http://tekui.neoscientists.org/"
license=('GPL')
depends=('lua' 'lua-filesystem' 'freetype2' 'libx11' 'libxft' 'fontconfig' 'libxxf86vm')
optdepends=('directfb: for the directfb driver')
options=("!strip")
source=(http://tekui.neoscientists.org/releases/${pkgname}-${pkgver}.tgz)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	sed -i 's|usr/local|usr|g' config
	sed -i 's|lua51|lua52|g;s|lua5.1|lua5.2|g;' config
	sed -i "s|lib/lua/5.1|lib/lua/5.2|g" config
	sed -i "s|share/lua/5.1|share/lua/5.2|g" config
	sed -i "s!<freetype/!<freetype2/!g" src/display_rawfb/display_rfb_mod.h
	make all 
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make PREFIX="$pkgdir"/usr install
  mv $pkgdir/usr/share/lua/5.1 $pkgdir/usr/share/lua/5.2 
  mv $pkgdir/usr/lib/lua/5.1 $pkgdir/usr/lib/lua/5.2 
}

md5sums=('f8e3d13e8c0868dfeca73212ee63ddc6')
