# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=qgis-svn
pkgver=15066
pkgrel=2
pkgdesc="A Geographic Information System (GIS) that supports vector, raster & database formats; dev version"
arch=('i686' 'x86_64')
url="http://qgis.org/"
license=('GPL')
depends=('jasper' 'curl' 'qt' 'gsl' 'grass' 'python2' 'python2-qt' 'giflib' 'xerces-c')
makedepends=('subversion' 'postgis>=1.4' 'netcdf' 'cmake')
provides=('qgis')
conflicts=('qgis')
options=('!makeflags')
source=(qgis.desktop)
md5sums=('8ab66039f2aba519b92f52272ec3c13e')
sha256sums=('1d487c6d4ce207593e687c6f6873b4463b1f5bda2a3edb1383735f9f3e27ff20')

_svntrunk=https://svn.osgeo.org/qgis/trunk/qgis
_svnmod=qgis_trunk

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

  cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DGRASS_PREFIX=/opt/grass \
		-DQGIS_MANUAL_SUBDIR=share/man

	sleep 10
	make || return 1
	make install DESTDIR=${pkgdir}

	# install some freedesktop.org compatibility
	install -D -m644 ${srcdir}/qgis.desktop \
		${pkgdir}/usr/share/applications/qgis.desktop
}
