# Maintainer: Dražen Odobašić <dodobasic at gmail>
pkgname=saga-gis-svn
pkgver=1152
pkgrel=1
pkgdesc="SAGA -System for Automated Geoscientific Analyses- is a hybrid GIS software"
url="http://www.saga-gis.org"
license="GPL"
arch=('i686' 'x86_64')
depends=('wxgtk>=2.8.10' 'gdal' 'proj' 'libtiff' 'jasper' 'unixodbc')
makedepends=('subversion' 'autoconf')
conflicts=('saga-gis')
provides=('saga-gis')

_svntrunk=https://saga-gis.svn.sourceforge.net/svnroot/saga-gis/trunk
_svnmod=saga-gis

source=(saga-gis.png
	saga-gis.desktop)
md5sums=('f211cbdb2c9feb3dec254a7755f9f154'
	 '5bce110e080c450de237635c5c651f54')

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
  cd "$srcdir/$_svnmod-build/saga-gis"


  autoreconf -i
  ./configure --prefix=/usr --enable-unicode
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -D -m644 $startdir/saga-gis.png $startdir/pkg/usr/share/pixmaps/saga-gis.png
  install -D -m644 $startdir/saga-gis.desktop $startdir/pkg/usr/share/applications/saga-gis.desktop
}
