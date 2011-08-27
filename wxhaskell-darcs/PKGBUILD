# Contributor: Yildirim Zaynal <asil.jinn@gmail.com>
pkgname=wxhaskell-darcs
pkgver=20071020
pkgrel=1
pkgdesc="wxHaskell is a portable and native GUI library for Haskell"
arch=(i686)
url="http://wxhaskell.sourceforge.net/"
license=('GPL')
source=()
depends=('gtk')
makedepends=('wxgtk' 'wxgtk-2.6' 'darcs' 'ghc')
md5sums=()

_darcsmod="wxhaskell"
_darcstrunk="http://darcs.haskell.org/"

build() {
  cd $startdir/src/
  # Erasing previous build
  msg "Checking for previous build"
  # get the sources
  if [[ -d $_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
    cd $_darcsmod
  fi
  
  #building 
  msg "Starting build"
  
  cp $startdir/configure.patch .
  #INSTALLDIR="$startdir/src/wxhaskell/"
  #cd $INSTALLDIR
  patch -p0 < configure.patch 
  ./configure --prefix=/usr --with-opengl
  make || return 1
  make DESTDIR="$startdir/pkg" install
  make DESTDIR="$startdir/pkg" wx 
  make DESTDIR="$startdir/pkg" wx-install 
}
