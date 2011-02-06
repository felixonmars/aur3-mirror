# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=opengrads-cvs
pkgver=20071026
pkgrel=1
pkgdesc="The Grid Analysis and Display System (GrADS) is an interactive \
desktop tool that is used for easy access, manipulation, and visualization \
of earth science data. The format of the data may be either binary, GRIB, \
NetCDF, or HDF-SDS (Scientific Data Sets)."
url="http://opengrads.org/"
license="GPL"
depends=(gcc-libs libnc-dap imagemagick gd netcdf shapelib libxaw)
makedepends=(cvs udunits libjpeg)
arch=(i686 x86_64)
provides=()
conflicts=(grads)
replaces=(grads)
backup=()
install=
source=('ftp://ftp.ac-grenoble.fr/ge/Xlibraries/libsx-2.04.tar.bz2'
        'ftp://ftp.hdfgroup.org/HDF/HDF_Current/src/HDF4.2r2.tar.gz'
	'opengrads.patch'
	'libsx.patch')
md5sums=('c2c3e477c4c6bd01db6e0248624b4102'
         '088540ae11cff4dcddedafd546e0831d'
         'e041b323876bbaa2936bbe5a6ddae841'
         '5046f8da9478bb4a4b36cf44b16eda6f')

_cvsroot=":pserver:anonymous:@opengrads.cvs.sourceforge.net:/cvsroot/opengrads"
_cvsmod="grads"

build() {
  cd $startdir/src
  msg "Connecting to opengrads.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
     cd $_cvsmod
     cvs -z3 update -d
  else
     cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
     cd $_cvsmod
  fi
  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r ../$_cvsmod ../$pkgname-build
  mkdir -p $startdir/src/$pkgname-build/supplibs/lib
  mkdir -p $startdir/src/$pkgname-build/supplibs/include
  cd $startdir/src/libsx-2.04
  patch -Np1 -i ../libsx.patch
  cd src
  make || return 1
  mkdir -p $startdir/pkg/usr/share/libsx
  install -m 644 dialogs/dialogs* $startdir/pkg/usr/share/libsx
  cp libsx.a $startdir/src/$pkgname-build/supplibs/lib
  cp libsx.h $startdir/src/$pkgname-build/supplibs/include
  cd $startdir/src/libsx-2.04/freq
  make libfreq.a || return 1
  cp freq.h $startdir/src/$pkgname-build/supplibs/include
  cp libfreq.a $startdir/src/$pkgname-build/supplibs/lib
  cd $startdir/src/HDF4.2r2
  ./configure --prefix=$startdir/src/$pkgname-build/supplibs \
          F77=gfortran --disable-netcdf FFLAGS=-ffixed-line-length-0
  make
  make install
  cd $startdir/src/$pkgname-build
  patch -Np0 -i ../opengrads.patch
  sed 's!/usr/local/lib/grads!/usr/share/grads!' -i src/gx.h
  if [ "$CARCH" = "x86_64" ]; then
    sed 's/32-bit/64-bit/' -i src/gacfg.c
  fi
  aclocal
  autoheader
  autoconf
  automake --add-missing
  CFLAGS="$CFLAGS -Wno-trigraphs" \
  CPPFLAGS="$CPPFLAGS -I$PWD/supplibs/include" \
  LDFLAGS="$LDFLAGS -L$PWD/supplibs/lib" \
  ./configure --enable-dyn-supplibs --prefix=/usr --with-wi \
              --with-hdf4=$startdir/src/$pkgname-build/supplibs
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
  mkdir -p $startdir/pkg/usr/share/grads/tables
  cd $startdir/src/$pkgname-build/data
  install -m 644 font*.dat hires lowres mres $startdir/pkg/usr/share/grads
  cd $startdir/src/$pkgname-build/data/tables
  install -m 644 B* $startdir/pkg/usr/share/grads/tables
  rm -f $startdir/pkg/usr/bin/wgrib
}
