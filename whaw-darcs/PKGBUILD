# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=whaw-darcs
pkgver=20080822
pkgrel=2
pkgdesc="window manager independent window layout tool"
arch=('i686' 'x86_64')
url="http://repetae.net/computer/whaw/"
license=('BSD3')
depends=('libxinerama' 'libxmu' 'popt')
makedepends=('darcs')
conflicts=('whaw')
source=(reconf)
_darcstrunk="http://repetae.net/repos"
_darcsmod="whaw"
md5sums=('b9716284b15d26b3e945e81826966b20')

build() {
  cd $srcdir
  msg "Checking for previous build"
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
  rm -r $srcdir/$_darcsmod-build
  cp -r $srcdir/$_darcsmod $srcdir/$_darcsmod-build
  install -m 0755 $startdir/reconf $srcdir/$_darcsmod-build/reconf
  cd $startdir/src/$_darcsmod-build
  msg "Starting build"
  #
  # BUILD
  #
  ./reconf
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
