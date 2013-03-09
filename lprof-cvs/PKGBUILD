# Contributor: Ermanno (erm67@yahoo.it)
pkgname=lprof-cvs
pkgver=20090105
pkgrel=3
arch=(i686 x86_64)
pkgdesc="Imaging device calibration tool. This will checkout and package the latest CVS version"
url="http://lprof.sourceforge.net/"
license="GPL"
depends=('qt4' 'lcms>=1.12' 'vigra>=1.3')
makedepends=('python>=1.53' 'scons' 'cvs')
provides=('lprof')
conflicts=('lprof')
md5sums=()
source=()
_cvsroot=":pserver:anonymous:@lprof.cvs.sourceforge.net:/cvsroot/lprof"
_cvsmod="lprof"

build() {
  cd $startdir/src
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

  export QTDIR=/usr
  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build
  sed -i "s/'tiff'/'tiff','png'/" SConstruct || return 1
  scons PREFIX=/usr || return 1
  install -d ${startdir}/pkg/usr
  scons PREFIX=${startdir}/pkg/usr install
  rm -r -f $_cvsmod-build
}
