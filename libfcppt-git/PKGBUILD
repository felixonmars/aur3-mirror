# Maintainer: Philipp Middendorf <pmidden@gmx.net>
pkgname=libfcppt-git
pkgver=20110613
pkgrel=1
pkgdesc="Freundlich's C++ Toolkit"
arch=('i686' 'x86_64')
url="http://fcppt.net"
license=('boost')
groups=()
depends=('boost>=1.44.0')
makedepends=('git' 'cmake>=2.6')
options=()
install=
source=()
noextract=()
md5sums=()

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

  _download_from_git 'fcppt' 'git://github.com/freundlich/fcppt.git'

  msg "Starting make..."

  cd "$srcdir/fcppt"

  rm -rf build;
  mkdir build;
  cd build;
  cmake\
	-D ENABLE_TEST:=OFF\
	-D ENABLE_EXAMPLES:=OFF\
	-D CMAKE_INSTALL_PREFIX:="/usr"\
	..
  make -j3
}

package() {
  cd "$srcdir/fcppt/build"
  make DESTDIR="$pkgdir" install
} 
