# Maintainer: Mykola Dolhyi <deletesobaka-gmail-com>
pkgname=sdformat-hg
pkgver=3.0.3
pkgrel=1
pkgdesc="SDF Converter for gazebo"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'tinyxml' 'doxygen' 'libtar')
provides=('sdformat')
conflicts=('sdformat')
makedepends=('mercurial' 'cmake')

md5sums=() #generate with 'makepkg -g'

_hgroot=http://bitbucket.org/osrf
_hgrepo=sdformat

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_hgrepo"
  
  rm -rf build

  mkdir build && cd build

  #
  # BUILD HERE
  #
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
		   -DCMAKE_INSTALL_LIBDIR="lib"

  make -j3
}

package() {
  cd "$srcdir/$_hgrepo/build"
  make DESTDIR="$pkgdir/" install
}
