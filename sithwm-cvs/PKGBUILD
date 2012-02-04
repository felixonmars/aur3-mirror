# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sithwm-cvs
pkgver=20080814
pkgrel=1
pkgdesc="a minimalist window manager - cvs version"
arch=('i686' 'x86_64')
url="http://sithwm.darkside.no/sithwm.html"
license=('GPL')
depends=('libx11')
makedepends=('cvs')
provides=(sithwm)
conflicts=(sithwm)
install=sithwm.install
source=()
md5sums=()

_cvsroot=":pserver:anonymous@sithwm.cvs.sourceforge.net:/cvsroot/sithwm"
_cvsmod="sithwm"

build() {
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -r $srcdir/$_cvsmod-build
  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build


  #
  # BUILD HERE
  #

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
