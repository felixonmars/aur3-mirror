# Maintainer: anergy <anergy.25110321@gmail.com>
pkgname=openstructure-git
pkgver=20111227
pkgrel=1
pkgdesc="Open-Source Computational Structural Biology Framework"
arch=('i686' 'x86_64')
url="http://www.openstructure.org/"
license=('LGPL3')
#groups=()
depends=('eigen2>2.0.6' 'boost>1.37' 'libpng' 'python2' 'qt>4.5' 'fftw' 'libtiff' 'sip' 'python2-pyqt')
makedepends=('git' 'cmake>2.6.4' )
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#source=()
#noextract=()
#md5sums=() 

_gitroot=https://dng.biozentrum.unibas.ch/git/ost.git 
_gitname=ost

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  sed -i \
  's/qt4_wrap_cpp(OST_GUI_MOCS "${HEADERS_TO_BE_MOCCED}")/qt4_wrap_cpp(OST_GUI_MOCS "${HEADERS_TO_BE_MOCCED}" OPTIONS -DBOOST_TT_HAS_OPERATOR_HPP_INCLUDED)/' \
         modules/gui/src/CMakeLists.txt
  cmake . -DPYTHON_BINARY=/usr/bin/python2 -DCMAKE_INSTALL_PREFIX=/usr 
  make -j4
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
