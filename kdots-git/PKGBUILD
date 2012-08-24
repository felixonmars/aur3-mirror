# Contributor: Artem Sereda <overmind88@gmail.com>
pkgname=kdots-git
pkgver=20120824
pkgrel=1
pkgdesc="The purpose of Dots game is to catch your opponent's dots by placing your 
dots on the game board where the lines cross"
arch=('i686' 'x86_64')
url="https://github.com/Ignotus/kdots"
license=('unknown')
depends=('qt>=4.7.0' 'kdelibs')
makedepends=('git' 'cmake' 'automoc4')
source=()
md5sums=()

_gitroot="https://github.com/Ignotus/kdots.git"
_gitname="kdots"

build() {
cd ${srcdir}

  if [[ -d $_gitname ]]; then
	(cd $_gitname && git pull origin)
  else
	git clone $_gitroot $_gitname
  fi

  cd $srcdir/$_gitname
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
  -DAutomoc4_DIR=/usr/lib/automoc4 \
  -DLibKDEGames_DIR=/usr/lib/cmake/KDEGames
  make  || return 1
  make DESTDIR=$startdir/pkg install
}  
