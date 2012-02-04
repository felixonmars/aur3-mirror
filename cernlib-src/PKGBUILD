# Maintainer: Michael Ivko <mihai@gorodok.net>
pkgname=cernlib-src
pkgver=2006
pkgrel=3
pkgdesc="The CERN programming library (install from sources)"
arch=('i686' 'x86_64')
url="http://cernlib.web.cern.ch/cernlib/"
license=('GPL' 'custom')
depends=('gcc-fortran' 'freetype2')
makedepends=('imake')
provides=('cernlib=2006' 'cfortran')
conflicts=('cernlib' 'cernlib2006' 'cfortran')
options=('!strip')
source=(http://cernlib.web.cern.ch/cernlib/download/${pkgver}_source/tar/${pkgver}_src.tar.gz
        g77
        cernlib.sh)
md5sums=('750c4804a2366ccd8e80c45a055f8ac5'
         '3f5d226924dd398e14f656ae55631c1b'
         'eb7f596222e8b5c960a518dbe0990753')

build() {
  export CERN="$srcdir"
  export CERN_LEVEL="$pkgver"
  export CERN_ROOT="$CERN/$CERN_LEVEL"
  export CVSCOSRC="$CERN_ROOT/src"
  export PATH="$CERN_ROOT/bin:$CERN_ROOT/util/bin:$PATH"

  cd "$CERN_ROOT"
  mkdir -p build bin lib util/bin

  if [ ! -f "$CERN_ROOT/util/bin/gmake" ]
  then
    ln -s `which make` "$CERN_ROOT/util/bin/gmake"
  fi
  if [ ! -f "$CERN_ROOT/util/bin/g77" ]
  then
    cp "$startdir/g77" "$CERN_ROOT/util/bin"
  fi

  cd $CERN_ROOT/build
  $CVSCOSRC/config/imake_boot

  #mv Makefile Makefile.old
  #sed 's/-fugly-complex/-std=legacy/' Makefile.old >Makefile
  #rm Makefile.old

  make bin/kuipc
  make scripts/Makefile

  cd scripts
  mv Makefile Makefile.old
  sed 's/INSTPGMFLAGS = -s//' Makefile.old >Makefile
  rm Makefile.old

  make install.bin
  cd $CERN_ROOT/bin
  chmod a+x cernlib gxint paw

  cd $CERN_ROOT/build/packlib
  make

  export EXTRA_DEFINES+="-D_GNU_SOURCE"
  export EXTRA_INCLUDES+="-I/usr/include/freetype2"

  cd $CERN_ROOT/build
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

package() {
  mkdir $pkgdir/usr
  cd $srcdir/$pkgver
  cp -RL bin $pkgdir/usr
  rm lib/xsneut95.dat
  cp -R lib $pkgdir/usr
  cp -RL src/include $pkgdir/usr/include
  install -D -m755 $srcdir/cernlib.sh $pkgdir/etc/profile.d/cernlib.sh
}

# vim:set ts=2 sw=2 et:
