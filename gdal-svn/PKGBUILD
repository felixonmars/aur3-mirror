# $Id: PKGBUILD 63577 2012-02-05 11:57:31Z ibiru $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gdal-svn
pkgver=24595
pkgrel=2
pkgdesc="A translator library for raster geospatial data formats"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg' 'libpng' 'libtiff' 'netcdf'  'python2' 'python2-numpy' 'cfitsio' 'sqlite3' 'libmysqlclient' 'postgresql-libs')
makedepends=('perl' 'swig' 'svn')
optdepends=('postgresql: postgresql database support'
            'mysql: mysql database support'
            'perl:  perl binding support'
            'swig:  perl binding support')

provides=('gdal')
conflicts=('gdal')
replaces=('gdal')

options=('!libtool')
changelog=$pkgname.changelog
source=(gdal-1.5.1-python-install.patch)
md5sums=('81afc1c26d29cee84aadb6924fe33861')

_svntrunk=https://svn.osgeo.org/gdal/trunk/gdal
_svnmod=gdal

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  # bug 23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed" 


  patch -Np0 -i ${srcdir}/gdal-1.5.1-python-install.patch

# python2 fixes
  sed -i 's_python python1.5_python2 python python1.5_' configure
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 \
              --with-geotiff --with-mysql --with-python --without-libtool --with-curl \
              --with-hdf5 --with-perl --with-geos --with-png

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile
  install -d ${pkgdir}/usr/lib/python2.7/site-packages/

  make || (cd swig/perl && make && cd ../.. && make)
}

package () {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR=${pkgdir} install

# install license
  install -D -m644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

#FS15477 clean up junks
  rm -f ${pkgdir}/usr/bin/*.dox
}
