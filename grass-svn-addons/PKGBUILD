
pkgname=grass-svn-addons
pkgver=52159
pkgrel=1
pkgdesc='Geographic Information System (GIS) used for geospatial data management and analysis, image processing, graphics/maps production, spatial modeling, and visualization. + addons programm for version 6'
arch=('i686' 'x86_64')
url='http://grass.itc.it/index.php'
license=('GPL')
conflicts=('grass')
provides=('grass')
depends=('gdal' 'tk' 'sqlite3' 'xorg-server' 'python' 'mesa' 'swig' 'proj' 'libjpeg' 'libpng' 'libtiff')
makedepends=('mysql' 'r' 'fftw' 'freetype2' 'subversion' 'postgresql' 'lapack' 'blas')
optdepends=('fftw: required for i.fft and i.ifft modules'
            'postgresql: PostgreSQL database interface'
            'r: R language interface'
            'lapack: required for GMATH library'
            'blas: required for GMATH library'
            'xorg-server: required for the graphical interface')
options=('!libtool' '!makeflags')
install=grass.install
source=('grass.desktop'
        'grass.sh'
        'grass.png'
        'grass-start.sh')

_svntrunk='https://svn.osgeo.org/grass/grass/branches/releasebranch_6_4'
_svnmod='grass64_release'

_svntrunk_addons='https://svn.osgeo.org/grass/grass-addons/grass6'
_svnmod_addons='grass6'

build() {

  msg "SVN GRASS"
  if [ -d $srcdir/${_svnmod} ]; then
    cd $srcdir/${_svnmod}
    svn up

    if [ -d $srcdir/${_svnmod}-build ]; then 
       rm -rf $srcdir/${_svnmod}-build
    fi
    cp -a $srcdir/${_svnmod} $srcdir/${_svnmod}-build
    cd $srcdir/${_svnmod}-build
  else
    cd $srcdir
    svn co ${_svntrunk} ${_svnmod}

    if [ -d $srcdir/${_svnmod}-build ]; then 
       rm -rf $srcdir/${_svnmod}-build
    fi
    cp -a $srcdir/${_svnmod} $srcdir/${_svnmod}-build
    cd $srcdir/${_svnmod}-build
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make GRASS"


  # python2 fix
  sed -i 's_python $< $(GISBASE) > $@_python2 $< $(GISBASE) > $@_' gui/wxpython/Makefile
  for file in $(find . -name '*.py' -print); do
    sed -i '1 i#!/usr/bin/python2' $file
  done

  find -type f -exec sed -i 's/$(PYTHON)/&2/g' {} \;

  export PYTHON=python2

    PYTHON=python2 ./configure \
    --prefix=/opt \
    --enable-largefile \
    --enable-shared  \
    --with-x \
    --x-includes="/usr/include/X11/" \
    --x-libraries="/usr/lib/X11/" \
    --with-gdal="/usr/bin/gdal-config" \
    --with-readline \
    --with-cairo \
    --with-sqlite \
    --with-postgres \
    --with-postgres-includes="/usr/include/postgresql" \
    --with-freetype \
    --with-freetype-includes="/usr/include/freetype2" \
    --with-cxx \
    --with-tcltk \
    --with-tcltk-includes="/usr/include" \
    --with-python="/usr/bin/python2-config" \
    --with-wxwidgets="/usr/bin/wx-config"\
    --with-proj-libs="/usr/lib" \
    --with-proj-includes="/usr/include" \
    --with-proj-share="/usr/share/proj" \
    --with-blas \
    --with-lapack \
    --with-fftw \
    --with-fftw-includes="/usr/include" \
    --with-fftw-libs="/usr/lib" \

  make

  make \
    INST_DIR=${pkgdir}/opt/grass-${pkgver} \
    BINDIR=${pkgdir}/usr/bin \
    install

  # fix $GISBASE path
  sed -i "s|GISBASE=${pkgdir}/opt/grass-${pkgver}|GISBASE=/opt/grass-${pkgver}|g" \
    ${pkgdir}/usr/bin/grass64

  # strip html docs
  #rm -r ${pkgdir}/opt/grass-${pkgver}/docs/html

  # install profile.d file
  install -D ${srcdir}/grass.sh \
    ${pkgdir}/etc/profile.d/grass.sh

  # install some freedesktop.org compatibility
  install -D -m644 ${srcdir}/grass.desktop \
    ${pkgdir}/usr/share/applications/grass.desktop

  install -D -m644 ${srcdir}/grass.png \
    ${pkgdir}/usr/share/pixmaps/grass.png

  install -D -m755 ${srcdir}/grass-start.sh \
    ${pkgdir}/usr/bin/grass-start


  # create a symlink for version work around
  ln -sf /opt/grass-${pkgver} ${pkgdir}/opt/grass

  install -d ${pkgdir}/etc/ld.so.conf.d/
  echo '/opt/grass/lib' > ${pkgdir}/etc/ld.so.conf.d/grass.conf

  #worck for tools catalog
  rm -rf ${pkgdir}/opt/grass-${pkgver}/tools/g.html2man
  cp tools/g.html2man/g.html2man ${pkgdir}/opt/grass-${pkgver}/tools/


  #ADDONS
  msg "SVN ADDONS"
  if [ -d $srcdir/${_svnmod_addons} ]; then
    cd $srcdir/${_svnmod_addons}
    svn up

    if [ -d $srcdir/${_svnmod_addons}-build ]; then 
       rm -rf $srcdir/${_svnmod_addons}-build
    fi
    cp -a $srcdir/${_svnmod_addons} $srcdir/${_svnmod_addons}-build
    cd $srcdir/${_svnmod_addons}-build
  else
    cd $srcdir
    svn co ${_svntrunk_addons} ${_svnmod_addons}

    if [ -d $srcdir/${_svnmod_addons}-build ]; then 
       rm -rf $srcdir/${_svnmod_addons}-build
    fi
    cp -a $srcdir/${_svnmod_addons} $srcdir/${_svnmod_addons}-build
    cd $srcdir/${_svnmod_addons}-build
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make ADDONS"

  # python2 fix
  for file in $(find . -type f -name '*.py' -print); do
    sed -i '1 i#!/usr/bin/python2' $file
  done

  find -type f -exec sed -i 's/$(PYTHON)/&2/g' {} \;


  msg "Starting make GRASS"

  make MODULE_TOPDIR=${pkgdir}/opt/grass-${pkgver}


}
md5sums=('3938610a05b838974f8c34af77de6f00'
         'db93730dd330f1539bd31b4373e1c00e'
         'ae778ed261a40b078a8465994a0eb25e'
         'd5e27e55d4a76fdee22d422122cf4751')
