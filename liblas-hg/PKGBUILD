# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Contributor: Your Name <youremail@domain.com>
pkgname=liblas-hg
pkgver=2187
pkgrel=1
pkgdesc="libLAS is a C/C++ library for reading and writing the very common LAS LiDAR format."
arch=('i686' 'x86_64')
url="http://www.liblas.org"
license=('BSD')
groups=()
depends=('boost>=1.38.0' 'gdal>=1.7.0' 'libgeotiff>=1.3.0')
makedepends=('mercurial' 'cmake' 'gcc>=4.0')
provides=()
conflicts=('liblas')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://hg.liblas.org/"
_hgrepo="main"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  mkdir makefiles
  cd makefiles
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr -DWITH_GDAL:BOOL=TRUE -DWITH_GEOTIFF:BOOL=TRUE ../
  
  make || return 1
  make install || return 1
} 
