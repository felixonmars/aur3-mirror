# $Id: PKGBUILD 69538 2012-04-18 02:22:16Z tdziedzic $
# Upstream Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=gdal
pkgname=libx32-gdal
pkgver=1.9.0
pkgrel=1.1
pkgdesc="A translator library for raster geospatial data formats (x32 ABI)"
arch=('x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('libx32-curl' 'libx32-geos' 'libx32-giflib' 'libx32-hdf5' 'libx32-libgeotiff' 'libx32-libjpeg' 'libx32-libpng' 'libx32-libtiff' 'libx32-netcdf' 'binx32-python2' 'libx32-python2-numpy' 'libx32-cfitsio' 'libx32-sqlite' 'libx32-libmysqlclient' 'libx32-postgresql-libs' "${_basepkgname}=${pkgver}")
makedepends=('gcc-multilib-x32' 'binx32-perl' 'swig')
optdepends=('binx32-postgresql: postgresql database support'
            'binx32-mysql: mysql database support'
            'binx32-perl:  perl binding support'
            'swig:  perl binding support')
options=('!libtool')
changelog=$_basepkgname.changelog
source=(http://download.osgeo.org/${_basepkgname}/${_basepkgname}-${pkgver}.tar.gz
        gdal-1.5.1-python-install.patch)
md5sums=('1853f3d8eb5232ae030abe007840cade'
         '81afc1c26d29cee84aadb6924fe33861')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"
  export PYTHON="python2-x32"
  #export PERL="perl-x32"

  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  # bug 23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed" 

  cd ${srcdir}/$_basepkgname-$pkgver
  patch -Np0 -i ${srcdir}/gdal-1.5.1-python-install.patch

# python2 fixes
  sed -i 's_python python1.5_python2 python python1.5_' configure
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  sed -i 's/perl/perl-x32/' swig/perl/Makefile
  sed -i 's/perl Makefile.PL/perl-x32 Makefile.PL/' swig/perl/GNUmakefile

  ./configure --prefix=/usr --libdir=/usr/libx32 --with-netcdf --with-libtiff --with-sqlite3 \
              --with-geotiff --with-mysql=/usr/bin/mysql-x32_config --with-python --without-libtool --with-curl \
              --with-hdf5 --with-perl --with-geos=/usr/bin/geos-x32-config --with-png

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile
  install -d ${pkgdir}/usr/libx32/python2.7/site-packages/

  make
}

package () {
  cd ${srcdir}/$_basepkgname-$pkgver

  make DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/bin/gdal-config" "${srcdir}/"
  mv "${pkgdir}/usr/include/cpl_config.h" "${srcdir}/"
  mv "${pkgdir}/usr/include/cpl_port.h" "${srcdir}/"
  sed -i 's/cpl_config.h/cpl_config-x32.h/' "${srcdir}/cpl_port.h"
  mv "${pkgdir}/usr/lib/perl5" "${pkgdir}/usr/libx32/"

  rm -rf "${pkgdir}/usr/"{bin,share,include,lib}

  install -dm755 "${pkgdir}/usr/"{bin,include}
  mv "${srcdir}/gdal-config" "${pkgdir}/usr/bin/gdal-config-x32"
  mv "${srcdir}/cpl_config.h" "${pkgdir}/usr/include/cpl_config-x32.h"
  mv "${srcdir}/cpl_port.h" "${pkgdir}/usr/include/cpl_port-x32.h"
  sed -i 's/lib\//libx32\//' "${pkgdir}/usr/libx32/perl5/x86_64-linux-thread-multi/Geo/check_dox.pl"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
