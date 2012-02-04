# Maintainer: Philipp Middendorf <pmidden@gmx.net>
pkgname=libawl-git
pkgver=20110613
pkgrel=1
pkgdesc="Abstract Window Library"
arch=('i686' 'x86_64')
url="http://freundlich.github.com/spacegameengine"
license=('boost')
groups=()
depends=('boost>=1.45' 'libfcppt-git' 'libgl')
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

  _download_from_git 'libawl' 'git://github.com/pmiddend/libawl.git'

  msg "Starting make..."

  cd "$srcdir/libawl"

  rm -rf build;
  mkdir build;
  cd build;
  cmake\
	-D CMAKE_INSTALL_PREFIX:="/usr"\
	..;
  make -j3
}

package() {
  cd "$srcdir/libawl/build"
  make DESTDIR="$pkgdir" install
} 
