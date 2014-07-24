# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor:Samuel Mesa <samuelmesa@linuxmail.org>
pkgname=orfeo-toolbox-hg
pkgver=16919.5780da3a9467
pkgrel=1
pkgdesc="ORFEO Toolbox (OTB) is an open source library of image processing algorithms"
arch=(x86_64)
url="http://www.orfeo-toolbox.org/otb/"
license=('CeCILL')
groups=()
depends=('cmake' 'gdal' 'freeglut' 'curl' 'fftw' 'tinyxml' 'muparser' 'openthreads')
makedepends=('mercurial')
optdepends=()
provides=(orfeo-toolbox-${pkgname%-hg})
conflicts=(orfeo-toolbox${pkgname%-hg})
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("$pkgname"::'hg+http://hg.orfeo-toolbox.org/OTB')
md5sums=('SKIP')


build() {

  cd $srcdir
  
  msg "starting make..."
  
  if [ -d build ]; then
    rm -rf build
  fi
 
  mkdir build
  cd build


  cmake ../$pkgname -DOTB_USE_EXTERNAL_BOOST:BOOL=ON \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DOTB_USE_CURL:BOOL=ON \
	  -DOTB_USE_EXTERNAL_EXPAT:BOOL=ON \
	  -DOTB_USE_JPEG2000:BOOL=ON \
	  -DOTB_USE_EXTERNAL_TINYXML:BOOL=ON \
	  -DOTB_USE_EXTERNAL_MUPARSER=ON \
	  -DOTB_BUILD_TESTING:BOOL=OFF \
	  -DOTB_BUILD_EXAMPLES:BOOL=OFF \
	  -DOTB_BUILD_APPLICATIONS:BOOL=ON \
	  -DOTB_WRAP_PYTHON:BOOL=ON \
	  -DPYTHON_EXECUTABLE=/usr/bin/python2 \
	  -DPYTHON_LIBRARIES=/usr/lib/libpython2.7.so \
	  -DPYTHON_INCLUDE_PATH=/usr/include/python2.7/ \
	  -DOTB_INSTALL_PYTHON_DIR=/usr/lib/python2.7/site-packages/ \
	  -DOTB_USE_EXTERNAL_ITK=OFF \
	  -DOTB_WRAP_QT:BOOL=ON \
	  -Wno-dev
  make

}

package() {
  # Install an ldconfig conf for Orfeo libs to be visible on the
  # system. Arch runs `ldconfig' after install automatically:
  touch "${srcdir}/${pkgname}.conf"
  echo "/usr/lib/otb" > "${srcdir}/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
  
  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}
pkgver() {
  cd ${srcdir}/$pkgname/
  echo $(hg identify -n).$(hg identify -i)
}