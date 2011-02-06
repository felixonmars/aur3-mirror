# Contributor: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
# Contributor: David Houston <cranky@archlinux.us>

pkgname=wolf4sdl-shareware
pkgver=1.6
pkgrel=2
pkgdesc='An SDL port of the FPS "Wolfenstein 3D" compiled for the shareware version'
arch=('i686' 'x86_64')
url="http://www.chaos-software.de.vu/"
license=('custom')
depends=('sdl_mixer' 'gcc-libs' 'wolf3d-shareware')
source=(http://www.fileden.com/files/2010/12/31/3049394//wolf4sdl-linuxpath-configdir-from-svn.patch http://www.fileden.com/files/2010/12/31/3049394//Wolf4SDL-1.6-src.zip)
md5sums=('4124398f4a79008676d3ffcf7df6a7b6'
         '61eed8ed819688663e399b5e79ed006f')

build() {
  cd Wolf4SDL-$pkgver-src
  sed -i -e 's/#define GOODTIMES/\/\/&/' -e 's/\/\/\(#define UPLOAD\)/\1/' version.h # set it as the shareware version
  patch -p1 < ../wolf4sdl-linuxpath-configdir-from-svn.patch # apply a patch to use the /usr/share/wolf3d for data files and the configdir option from svn to use ~/.wolf4sdl for saved games

  make BINARY=wolf4sdl || return 1
  make PREFIX="$pkgdir"/usr BINARY=wolf4sdl install

  mkdir -p "$pkgdir"/usr/share/{wolf3d,licenses/wolf4sdl}
  install -m644 license*.txt "$pkgdir"/usr/share/licenses/wolf4sdl/
}

