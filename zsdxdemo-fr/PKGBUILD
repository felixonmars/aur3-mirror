# Maintainer: Sam101 <zoetrem@gmail.com>
# Contributor: Sam101 <zoetrem@gmail.com>
pkgname=zsdxdemo-fr
pkgver=1.0
pkgrel=3
pkgdesc="Un jeu amateur Zelda libre et gratuit inspire de Zelda en 2D - demo contenant le debut du jeu."
arch=('i686' 'x86_64')
url="http://www.zelda-solarus.com"
license=('GPL')
groups=
provides=('zsdx')
depends=('lua' 'sdl' 'sdl_image' 'sdl_ttf' 'physfs' 'openal' 'libsndfile')
makedepends=('cmake' 'gcc' 'zip')
conflicts=()
replaces=()
backup=()
source=(http://www.zelda-solarus.com/downloads/zsdx/zsdxdemo_src_1.0.tar.gz)
md5sums=('1d582fe8f9003966c2e54293556e62e2')
 
build() {
  cd $srcdir/zsdxdemo
  mkdir -p $pkgdir/usr/share/games/zsdx

  mkdir -p $srcdir/zsdxdemo/include/lua5.1
  ln -s /usr/include/lua.hpp $srcdir/zsdxdemo/include/lua5.1/lua.hpp 
  mkdir $srcdir/zsdxdemo/libraries
  ln -s /usr/lib/liblua.so.5.1 $srcdir/zsdxdemo/libraries/liblua5.1.so
  
  export LIBRARY_PATH="$srcdir/zsdxdemo/libraries"
  cmake -D CMAKE_INSTALL_PREFIX=$srcdir/zsdxdemo .
  make || return 1
  make install

  cp $srcdir/zsdxdemo/bin/zsdx $pkgdir/usr/share/games/zsdx
  cp $srcdir/zsdxdemo/data.zsdx $pkgdir/usr/share/games/zsdx/data.zsdx

  mkdir -p $pkgdir/usr/bin
  echo "/usr/share/games/zsdx/zsdx -datapath=/usr/share/games/zsdx" > $pkgdir/usr/bin/zsdx
  chmod 755 $pkgdir/usr/bin/zsdx

}
