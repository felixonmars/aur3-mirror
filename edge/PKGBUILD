# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=edge
pkgver=1.35
pkgrel=1
pkgdesc="An enhanced port of the Doom game engine"
arch=('i686' 'x86_64')
url="http://edge.sourceforge.net/"
license=('GPL')
depends=('sdl' 'libgl' 'libvorbis' 'fltk' 'glew')
makedepends=('scons>=0.96')
source=(http://downloads.sourceforge.net/$pkgname/Edge-$pkgver-source.tar.bz2
	http://downloads.sourceforge.net/$pkgname/$pkgname-wad-5.9.zip)
md5sums=('772232595ae8160b60775781ce73825d'
         '49e3b319719f50e9f5bd30f7c5d2f18f')

build() {
  cd Edge-$pkgver-source

  # change default iwad path
  sed 's|iwad_dir = "."|iwad_dir = "/usr/share/doom"|g' -i src/e_main.cc

  # add missing includes
  sed '1i#include <algorithm>' -i src/p_plane.cc

  scons release=true || return 1

  install -Dm755 edge_raw "$pkgdir"/usr/bin/edge
  install -Dm644 ../edge.wad "$pkgdir"/usr/share/doom/edge.wad
}
