# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
pkgname=quilt-cvs
pkgver=20080330
pkgrel=1
pkgdesc="CVS version of quilt"
url="http://savannah.nongnu.org/projects/quilt"
license="GPL"
depends=('diffstat')
makedepends=('cvs' 'pkgconfig')
conflicts=('quilt')
provides=('quilt')
arch=(i686 x86_64)
source=()
md5sums=()

_cvsroot=":pserver:anonymous:@cvs.savannah.nongnu.org:/sources/quilt"
_cvsmod="quilt"

build() {
  cd $startdir/src/

  msg "Connecting to $_cvsmod.cvs.savannah.nongnu.org CVS server...."
  cvs -d$_cvsroot checkout $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r $_cvsmod $_cvsmod-build
  cd $_cvsmod-build
  
  #./configure --prefix=/usr
  aclocal
  autoconf
  automake --add-missing
 ./configure --prefix=/usr

  make BUILD_ROOT=${startdir}/pkg RELEASE=$pkgver || return 1
  make DESTDIR=$startdir/pkg BUILD_ROOT=${startdir}/pkg install

  rm -r $startdir/src/$_cvsmod-build
}
