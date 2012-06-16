# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=ozi2geotiff-svn
pkgver=6
pkgrel=4
pkgdesc="convert maps from Ozi Explorer format to GeoTiff"
arch=(any)
url="http://sourceforge.net/projects/ozi2geotiff/"
license=('GPL')
depends=('python2' 'gdal' 'libgeotiff')
makedepends=('subversion')
optdepends=('gpsbabel: for run ozi2gpx script converter')
provides=(ozi2geotiff)
conflicts=(ozi2geotiff)
replaces=(ozi2geotiff)
source=(ozi2geotiff ozi2gpx crash-fix.patch)

_svntrunk=https://ozi2geotiff.svn.sourceforge.net/svnroot/ozi2geotiff/trunk
_svnmod=ozi2geotiff-svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p0 < $srcdir/crash-fix.patch

  install -m 755 -o root -g root -D ${srcdir}/ozi2geotiff ${pkgdir}/usr/bin/ozi2geotiff
  install -m 755 -o root -g root -D ${srcdir}/ozi2gpx     ${pkgdir}/usr/bin/ozi2gpx
  install -m 755 -o root -g root -D ozi2geotiff.py        ${pkgdir}/usr/lib/ozi2geotiff/ozi2geotiff.py
}
md5sums=('4e4630eb0070fed8cd85117d6dcc788b'
         '3c374793a2e19383ea6066b278eefd77'
         'a379d11807ca1e75d96a54068e71b812')
