# Contributor: Cedric GESTES <ctaf42@gmail.com>
pkgname=clanbomber
pkgver=2.1.1
pkgrel=3
pkgdesc="clanbomber is a fork of the ClanBomber game that can be found at http://clanbomber.sourceforge.net/"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/clanbomber"
license=('GPL')
depends=('boost' 'sdl_ttf' 'sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=(http://dl.sv.gnu.org/releases/clanbomber/clanbomber-2.1.1.tar.lzma)
noextract=()
md5sums=('492d777a82fbcb3bdf60be6b1f156965')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i 's/dir_iter->filename()/dir_iter->path().filename()/g' src/Map.cpp
  sed -i 's/map_name = filename.*/map_name = filename.string();/g' src/MapEntry.cpp
  make || return 1
#  make DESTDIR=$startdir/pkg install || return 1
  make prefix=$pkgdir/usr install || return 1
}


#depends=('libpng' 'glibc' 'libx11' 'libice' 'zlib' 'libxau' 'libxdmcp')

