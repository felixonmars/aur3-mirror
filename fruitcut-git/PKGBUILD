# Maintainer: Philipp Middendorf <pmidden@gmx.net>
pkgname=fruitcut-git
pkgver=20110613
pkgrel=1
pkgdesc="Arcade game where the goal is to cut fruits to earn points"
arch=('i686' 'x86_64')
url="http://fruitcut.com"
license=('GPL')
groups=()
depends=('libfcppt-git' 'libmizuiro-git' 'libawl-git' 'libsge-git' 'boost>=1.46.0' 'bullet')
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

  _download_from_git 'fruitcut' 'git://github.com/pmiddend/fruitcut.git'

  msg "Starting make..."

  cd "$srcdir/fruitcut"

  rm -rf build;
  mkdir build;
  cd build;
  cmake -D CMAKE_INSTALL_PREFIX:="/usr" ..;
  make -j3
}

package() {
  cd "$srcdir/fruitcut/build"
  make DESTDIR="$pkgdir" install
} 
