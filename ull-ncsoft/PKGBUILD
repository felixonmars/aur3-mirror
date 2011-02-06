# Contributor: Sam Anderson <coarse.sand@gmail.com>
pkgname=ull-ncsoft
pkgver=0.8
pkgrel=1
pkgdesc="launching and patching utility for NCSoft games"
arch=('i686' 'x86_64')
url="http://www.lotrolinux.com/ULL/"
license=('GPL')
depends=('mono' 'xdelta' 'gtk-sharp-2' 'libglade')
source=("http://internap.dl.sourceforge.net/sourceforge/ull/ULL-${pkgver}.tar.bz2")
md5sums=('20e61fe4d0c6e396171555327387be1f')

build() {
  cd "$stardir/src/" 
  
  export MONO_SHARED_DIR=$startdir/src/
  mkdir -p $MONO_SHARED_DIR || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
}

