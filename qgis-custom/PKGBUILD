#!/bin/bash
# ^ Above shabeng-line for automatic syntax-highlighting in some editors.

# Maintainer:  Dreieck
# Contributor: Lantald < lantald at gmx.com >
# Contributor: SaultDon <sault.don gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

_pkgname=qgis
pkgname=qgis-custom
pkgver=2.0.1
pkgrel=1
pkgdesc='Quantum GIS is a Geographic Information System (GIS) that supports vector, raster & database formats'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
# update to http://www.qgis.org/wiki/Building_QGIS_from_Source#Overview
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")

# 'openthreads' is also provided by 'openscenegraph', which in turn conflicts with the standalone-version of 'openthreads'. 'openscenegraph' is needed as a dependency of 'osgearth'. So, make sure 'openscenegraph' get's installed instead of 'openthreads'.
# Furthermore, on my machine 'osgearth' fails to build, but 'osgearth-git' builds.
depends=('libmysqlclient' 'postgresql-libs' 'sqlite3' 'jasper' 'curl' 'pyqt' 'python2' 'python2-sip>=4.15.3' 'python2-pyqt4>=4.10.4a' 'giflib'  'cfitsio' 'qwt' 'gdal' 'flex' 'bison' 'libspatialite' 'spatialindex' 'python2-qscintilla' 'python2-psycopg2' 'proj' 'gdal' 'geos' 'osgearth' 'openthreads')

makedepends=('cmake' 'grass' 'gsl' 'postgis' 'netcdf' 'fcgi' 'python2-sip>=4.15.3' 'python2-pyqt4>=4.10.4a')

optdepends=('postgis: postgis support and SPIT plugin'
            'fcgi: qgis mapserver'
            'python2-sip: python-support'
            'grass: grass plugin'
            'gsl: georeferencer')
options=()
install=${_pkgname}.install
source=("http://qgis.org/downloads/${_pkgname}-${pkgver}.tar.bz2"
        "qgis.sh"
        "rev-349a4c97.diff::https://hub.qgis.org/projects/quantum-gis/repository/revisions/349a4c974fab88fdda0d612dea8defe037ec50ba/diff.diff"
        "http://hub.qgis.org/attachments/download/6230/QgsFieldValidator.diff")

md5sums=('3822c7dd70e2d893a0f1baa9c72316d2'
	 '488a57456d9f3ca5965e0aed617cd8fa'
         '4d66e5546feb08157ed5794b58891b01'
	 '775176bb6b9a600e9428a9a34bd88825')

build() {
  
  # Fix compile error from using updated sip
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/rev-349a4c97.diff"
  patch -Np1 -i "${srcdir}/QgsFieldValidator.diff"

  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake "../${_pkgname}-${pkgver}" \
    -DENABLE_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGRASS_PREFIX=/opt/grass \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYTHON_SITE_PACKAGES_DIR=/usr/lib/python2.7/site-packages \
    -DPYTHON_INCLUDE_PATH=/usr/include/python2.7 \
    -DQT_QMAKE_EXECUTABLE=qmake4 \
    -DWITH_MAPSERVER=TRUE \
    -DWITH_INTERNAL_SPATIALITE=TRUE \
    -DWITH_PYSPATIALITE=TRUE \
    -DWITH_PYSPATIALITE=TRUE \
    -DWITH_ORACLE=FALSE \
    -DWITH_GLOBE=TRUE
    
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
  
  # create a more user-friendly application name link
  ln -s /usr/bin/qgis "$pkgdir/usr/bin/quantum-gis"
  
  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir"/"${_pkgname}-${pkgver}"/debian/qgis.desktop "$pkgdir"/usr/share/applications/qgis.desktop
  install -m644 "$srcdir"/"${_pkgname}-${pkgver}"/debian/qbrowser.desktop "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir/usr/share/pixmaps" "$pkgdir/usr/share/mimelnk/application"
  ln -s /usr/share/qgis/images/icons/qgis-icon.png "$pkgdir/usr/share/pixmaps/qgis-icon.png"
  ln -s /usr/share/qgis/images/icons/qgis-mime-icon.png "$pkgdir/usr/share/pixmaps/qgis-mime-icon.png"
  for mime in "$srcdir/${_pkgname}-${pkgver}/debian/mime/application"/*.desktop; do
    install -m644 "${mime}" "$pkgdir/usr/share/mimelnk/application"
  done
  install -Dm644 "${srcdir}/qgis.sh" "${pkgdir}/etc/profile.d/qgis.sh"
}

