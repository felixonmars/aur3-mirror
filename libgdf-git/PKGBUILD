# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Martin Billinger <flkazemakase@gmail.com>
pkgname=libgdf-git
pkgver=20121129
pkgrel=1
epoch=
pkgdesc="C++ implementation of GDF, the general dataformat for biosignals"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libgdf/"
license=('LGPL')
groups=()
depends=(boost-libs)
makedepends=('cmake' 'boost')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot='git://libgdf.git.sourceforge.net/gitroot/libgdf/libgdf'
_gitname='libgdf'

build() {
  cd "$srcdir"
  msg "Connecting to git server..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    msg "The local files are up-to-date"
  else
    git clone $_gitroot $_gitname --depth=1
    cd $_gitname
  fi
  mkdir -p build
  cd build  
  cmake .. -DBUILD_TESTING:BOOL=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

check() {
  cd "$srcdir/$_gitname/build"
  make -k test
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}

