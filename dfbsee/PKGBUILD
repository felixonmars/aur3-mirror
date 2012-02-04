# Contributor: H.Gokhan SARI <hsa2@difuzyon.net>
# Original by: Alois Belaska <lloyd@centrum.cz>

pkgname=dfbsee
pkgver=20080723
pkgrel=1
pkgdesc="DirectFB video player"
url='http://www.directfb.org/'
arch=( i686 )
license=('GPL')
depends=('directfb')
provides=('dfbsee')
makedepends=('cvs')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.directfb.org:/cvs/directfb"
_cvsmod="DFBSee"

build() {
  cd $startdir/src
  msg "Connecting to cvs.directfb.org CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r $_cvsmod $_cvsmod-build
  cd $_cvsmod-build

  ./autogen.sh --prefix=/usr
      
  make || return 1
  make DESTDIR=$startdir/pkg install

  # remove .la files
  find $startdir/pkg -type f -name *.la -exec rm -f '{}' \;
  
  rm -r $startdir/src/$_cvsmod-build
}
