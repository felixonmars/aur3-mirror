# Maintainer: Philipp Middendorf <pmidden@gmx.net>
pkgname=libsge-git
pkgver=20110613
pkgrel=1
pkgdesc="An easy to use game engine written in C++"
arch=('i686' 'x86_64')
url="http://freundlich.github.com/spacegameengine"
license=('LGPL')
groups=()
depends=('libfcppt-git' 'libmizuiro-git' 'libawl-git' 'boost>=1.46.0' 'libxi>=1.4.1' 'libx11>=1.4.1' 'libgl' 'freetype2' 'glew' 'cegui' 'libogg' 'libvorbis' 'libpng' 'openal' 'bullet' 'libxrandr')
makedepends=('git' 'cmake>=2.6')
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_download_from_git()
{
  msg "Downloading $1..."
  if [ -d $1 ]; then
    cd $1;
    if ! git pull origin; then
	msg "Pulling $1 didn't work"
	cd ..;
	false;
    else
      msg "Done with $1."
      cd ..
    fi;
  else
    msg "Doesn't exist yet, cloning..."
    git clone $2 $1 --depth 1 
    msg "Done with $1"
  fi;
}

build() {
  cd "$srcdir"

  _download_from_git 'spacegameengine' 'git://github.com/freundlich/spacegameengine.git'

  msg "Starting make..."

  cd "$srcdir/spacegameengine"

  rm -rf build;
  mkdir build;
  cd build;
  cmake\
	-D ENABLE_EXAMPLES:=OFF\
	-D ENABLE_TEST:=OFF\
	-D ENABLE_XF86VMODE:=OFF\
	-D CMAKE_INSTALL_PREFIX:="/usr"\
	..;
  make -j3
}

package() {
  cd "$srcdir/spacegameengine/build"
  make DESTDIR="$pkgdir" install
} 
