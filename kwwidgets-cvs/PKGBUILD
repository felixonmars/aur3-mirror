
pkgname=kwwidgets-cvs
pkgver=20110424
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="KWWidgets is a free, cross-platform and open-license GUI Toolkit."
url="http://www.kwwidgets.org/Wiki/KWWidgets"
license=('custom')
depends=('expat' 'gcc-libs')
optdepends=() 
makedepends=('cmake' 'cvs' 'libpng>=1.4.0')
conflicts=('kwwidgets')
provides=('kwwidgets')
#install=$pkgname.install
source=('png_set_gray.patch')
md5sums=('0fab01e4b3a899ad08e0a0d3d4b8e596')

_cvsmod="KWWidgets"
_cvsroot=":pserver:anoncvs@www.kwwidgets.org:/cvsroot/$_cvsmod"

build() {
  cd $srcdir
  msg "Connecting to anoncvs@www.kwwidgets.org..."
  if [ -d $_cvsmod/CVS ]; then
    echo "fetching only new files"
    cd $_cvsmod
    cvs -z3 update -d
  else
    echo "fetching whole branch"
    cvs -z3 -d$_cvsroot co -D $pkgver -P $_cvsmod
  fi
  
  msg "Applying patches..."
  cd $srcdir/$_cvsmod
  patch -Np0 -i ../png_set_gray.patch || return 1

  #cd $srcdir/$_cvsmod
  msg "Running cmake..."
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_TESTING=OFF \
          -DKWWidgets_INSTALL_BIN_DIR="/bin" \
          -DKWWidgets_INSTALL_LIB_DIR="/lib" \


  msg "Running make..."
  make
}
package() {
  cd $srcdir/$_cvsmod
  make DESTDIR=$pkgdir install
}

