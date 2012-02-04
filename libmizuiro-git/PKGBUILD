# Maintainer: Philipp Middendorf <pmidden@gmx.net>
pkgname=libmizuiro-git
pkgver=20110613
pkgrel=1
pkgdesc="A generic C++ image library"
arch=('i686' 'x86_64')
url="http://freundlich.github.com/spacegameengine"
license=('boost')
groups=()
depends=('boost>=1.40.0' 'libfcppt-git')
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
    git clone $2 $1
    msg "Done with $1"
  fi;
}

build() {
  cd "$srcdir"

  _download_from_git 'mizuiro' 'git://github.com/freundlich/mizuiro.git'

  msg "Starting make..."

  cd "$srcdir/mizuiro"

  rm -rf build;
  mkdir build;
  cd build;
  cmake\
	-D ENABLE_FCPPT:=ON\
	-D ENABLE_EXAMPLES:=OFF\
	-D ENABLE_TEST:=OFF\
	-D CMAKE_INSTALL_PREFIX:="/usr"\
	..;
  make -j3
}

package() {
  cd "$srcdir/mizuiro/build"
  make DESTDIR="$pkgdir" install
} 
