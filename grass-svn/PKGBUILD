# Maintainer: Gunther Schulz < mail at guntherschulz.de >
# Contributor: Emiliano Vavassori < syntaxerrormmm at gmail.com > 
# Contributor: Thomas Dziedzic < gostrc at gmail.com >

pkgname=grass-svn
pkgver=52801
pkgrel=1
pkgdesc='GRASS 7 development version. Geographic Information System (GIS) used for geospatial data management and analysis, image processing, graphics/maps production, spatial modeling, and visualization.'
arch=('i686' 'x86_64')
url='http://grass.itc.it/index.php'
license=('GPL')
conflicts=('grass-svn')
provides=('grass-svn')
#depends=( 'cairo' 'desktop-file-utils' 'flex' 'ncurses' 'python2-dateutil' 'cfitsio' 'fftw' 'gdal' 'libjpeg' 'libpng' 'libtiff' 'libxmu' 'mesa' 'python2' 'proj' 'wxpython' 'xorg-server')
depends=( 'tk' 'tcl' 'flex' 'python2-dateutil' 'fftw' 'gdal' 'libxmu' 'mesa' 'wxpython' 'xorg-server')
#makedepends=('sqlite' 'postgresql' 'freetype2' 'subversion')
makedepends=('freetype2' 'subversion')
optdepends=(
            #'fftw: required for i.fft and i.ifft modules'
            #'postgresql: PostgreSQL database interface'
            'r: R language interface'
            'lapack: required for GMATH library'
            'blas: required for GMATH library'
            #'xorg-server: required for the graphical interface'
	    'mysql: mysql database interface')
options=('!libtool' '!makeflags')
install=grass-svn.install
source=('grass-svn.sh')
md5sums=('558823efa51a4f68f40c3c4986973241')

_svntrunk='https://svn.osgeo.org/grass/grass/trunk/'
_svnmod='grass_trunk'

build() {
  if [ -d ${_svnmod} ]; then
    cd ${_svnmod}
    svn up
  else
    svn co ${_svntrunk} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"

  msg "Applying fixes..."

  # python2 fix
  sed -i 's_python $< $(GISBASE) > $@_python2 $< $(GISBASE) > $@_' gui/wxpython/Makefile
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done


  # the following exports are probably not needed
  export DOXNAME=python2

  # fix wxpython error
  sed -r -i 's/python(\s|$)/&2/' ./include/Make/Platform.make.in

  export PYTHON=python2


  msg "Starting make..."

  # see ${srcdir}/grass_trunk/REQUIREMENTS.html for options
  ./configure \
    --prefix=/opt \
    --with-fftw \
    --with-postgres \
    --with-freetype \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-nls \
    --with-gdal \
    --with-geos \
    --with-proj \
    --with-proj-share=/usr/share/proj \
    --with-python=/usr/bin/python2-config \
    --with-wxwidgets=/usr/bin/wx-config \
    --with-sqlite \

    # These need pandoc (in AUR)
    # --with-blas \
    # --with-lapack \
  
  make
}

package() {
  cd ${_svnmod}

  make \
    INST_DIR=${pkgdir}/opt/grass-svn \
    UNIX_BIN=${pkgdir}/usr/bin \
    ETC=${pkgdir}/etc \
    install

  msg "Applying package fixes..."
  # fix paths
  find ${pkgdir}/ -type f -exec sed -r -i "s|/.*/pkg/opt/grass-svn|/opt/grass-svn|g" {} \;

  # install profile.d file
  install -D ${srcdir}/grass-svn.sh \
    ${pkgdir}/etc/profile.d/grass-svn.sh

  # install some freedesktop.org compatibility
  sed -r -i -e 's_^Icon=/usr/share/icons/grass-48x48.png_Icon=/usr/share/pixmaps/grass-svn-48x48.png_' \
	 -e 's/grass7(\s|$)/grass70/' -e "s/Name=GRASS GIS($)/Name=GRASS GIS R${pkgver}/" ./gui/icons/grass.desktop
  install -D -m644 gui/icons/grass.desktop \
    ${pkgdir}/usr/share/applications/grass-svn.desktop
  install -D -m644 gui/icons/grass-48x48.png \
    ${pkgdir}/usr/share/pixmaps/grass-svn-48x48.png

  echo  "/opt/grass-svn/lib" > ${srcdir}/grass-svn.conf
  install -D -m644 ${srcdir}/grass-svn.conf \
    ${pkgdir}/etc/ld.so.conf.d/grass-svn.conf

  # install g.html2man which is needed for some extensions
  # FS#25705 - [grass] g.html2man is not installed into package directory
  # https://bugs.archlinux.org/task/25705
  # most likely upstream problem which will be fixed in a version later than 6.4.1
  # cp -r ./tools/g.html2man ${pkgdir}/opt/${pkgname}-${pkgver}/tools


}
