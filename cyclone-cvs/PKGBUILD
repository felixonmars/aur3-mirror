# Contributor: Dmitry A. Ilyashevich <dmitry.ilyashevich@gmail.com>

pkgname=cyclone-cvs
pkgver=20060712
pkgrel=1
pkgdesc="Safe dialect of C."
url="http://cyclone.thelanguage.org/"
license="BSD"
depends=('gcc')
makedepends=('cvs')
conflicts=('cyclone')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.eecs.harvard.edu:/home/cyclone/cvsroot"
_cvsmod="cyclone"

build() {
  cd $startdir/src
  msg "Connecting to the CVS server...."
  cvs -z3 -d $_cvsroot co $_cvsmod
  cd $_cvsmod
  
  ./configure --prefix=/usr

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  make || return 1
  make prefix=$startdir/pkg/usr install
}

