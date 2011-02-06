# contributor: Dominika Solarz <dominikasolarz@gmail.com>

pkgname=offender-cvs
pkgver=20081021
pkgrel=1
pkgdesc="An entertaining 2d space shooter."
url="http://offender.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
makedepends=('cvs')
provides=('offender')
conflicts=('offender')
source=()
md5sums=('')

_cvsroot=":pserver:anonymous@offender.cvs.sourceforge.net:/cvsroot/offender"
_cvsmod="offender"

build() {

  #Grab the sources with cvs
  cd $srcdir
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d || return 1
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod || return 1
    cd $_cvsmod
  fi
  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  rm -r $srcdir/$_cvsmod-build
  cp -r $srcdir/$_cvsmod $srcdir/$_cvsmod-build
  cd $srcdir/$_cvsmod-build
  
  #Build and install the package
  mkdir config
  ./bootstrap || return 1
  ./configure --prefix=$pkgdir/usr --exec-prefix=$pkgdir/usr || return 1
  make || return 1
  make install || return 1
  
}

# vim:set ts=2 sw=2 et:
