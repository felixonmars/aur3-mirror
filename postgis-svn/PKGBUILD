    # Maintainer: Dominik Fuchs <dominik.fuchs (at) wur.nl>

pkgname=postgis-svn
pkgver=6280
pkgrel=2
pkgdesc="Adds support for geographic objects to PostgreSQL; including the experimental PostGis RASTER type."
arch=('i686' 'x86_64')
url="http://trac.osgeo.org/postgis/"
license=('GPL')
depends=('postgresql>=8.4.1' 'gdal')
options=('!makeflags')
provides=('postgis')
conflicts=('postgis')
source=()
md5sums=()
_svntrunk=http://svn.osgeo.org/postgis/trunk
_svnmod=trunk

build() {

  cd "$srcdir"


  msg "Downloading Postgis: connecting to svn.osgeo.org..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r $_svnmod $_svnmod-build

  cd $_svnmod-build

  sed 's:$(PGSQL_BINDIR):$(DESTDIR)/$(PGSQL_BINDIR):g' -i ${srcdir}/trunk-build/raster/scripts/python/Makefile.in 

  ./autogen.sh
  LDFLAGS=-lstdc++ ./configure --with-raster
  make
  make DESTDIR=${pkgdir} install

}

