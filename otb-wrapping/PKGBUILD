# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
pkgname=otb-wrapping
pkgver=544.b52cb91b1eb6
pkgrel=1
pkgdesc="low levelPython/Java bindings for orfeo-toolbox"
arch=(x86_64)
url="http://www.orfeo-toolbox.org/otb/"
license=('CeCILL')
groups=()
depends=('cmake' 'gdal' 'freeglut' 'curl' 'fftw' 'mercurial' 'orfeo-toolbox' 'cableswig-cvs' 'pygccxml' 'swig')
makedepends=()
optdepends=( 'fltk' 'fltk2')
provides=(otb-wrapping)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("OTB-Wrapping::hg+http://hg.orfeo-toolbox.org/OTB-Wrapping")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

build() {

 
  msg "starting make..."
  cd $srcdir
  echo $srcdir
  #rm -rf build/
  #mkdir build/
  cd build
  
  export CMAKE_PREFIX_PATH=/usr/lib/lib/otb/
  cmake ../OTB-Wrapping  -DWRAP_ITK_PYTHON:BOOL=ON
  #cmake CMakeLists.txt
  
  make -j9
}

package() {

  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd ${srcdir}/OTB-Wrapping
 echo $(hg identify -n).$(hg identify -i)
}