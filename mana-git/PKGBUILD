# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Karl Kochs <captainhaggy at i2pmail dot org>

_pkgname=mana
pkgname=mana-git
pkgver=0.6.1.66.gd4a4072
pkgrel=1
epoch=1
pkgdesc="Client for The Mana World (TMW)."
arch=('i686' 'x86_64')
url="http://manasource.org/"
license=('GPL')
depends=('curl' 'guichan' 'enet' 'libgl' 'libxml2' 'physfs' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
makedepends=('git' 'cmake')
provides=('mana')
conflicts=('mana')
source=('git://github.com/mana/mana.git')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {  	
	cd ${srcdir}/$_pkgname
	cmake .
   	make
}

package() {
	cd ${srcdir}/$_pkgname
	make DESTDIR=${pkgdir} install
}
