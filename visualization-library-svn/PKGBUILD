# Maintainer: Vitaly M. <jauthu@gmail.com.com>

pkgname=visualization-library-svn
pkgver=1274
pkgrel=2
pkgdesc="A lightweight C++ middleware for 2D and 3D graphics"
arch=('i686' 'x86_64')
url="http://www.visualizationlibrary.org"
license=('BSD')
# SDL, GLUT and  are in depends 'cause VL comes 
# with SDL and GLUT examples and tests
depends=('mesa' 'sdl' 'freeglut' 'qt') 
makedepends=('gcc' 'libtool' 'make' 'cmake' 
             'sdl' 'doxygen' 'qt' 'wxgtk')
conflicts=('visualization-library'
          'visualization-library-glut'
          'visualization-library-sdl'
          'visualization-library-qt'
          'visualization-library-wx')
provides=('visualization-library'
          'visualization-library-glut'
          'visualization-library-sdl'
          'visualization-library-qt')

_svntrunk=http://visualizationlibrary.googlecode.com/svn/trunk
_svnmod=vl-svn

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  find . -type d -name '.svn' -print0 | xargs -0 rm -rf

  # BUILD

  rm -rf build
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DVL_GUI_SDL_SUPPORT=ON \
      -DVL_GUI_GLUT_SUPPORT=ON \
      -DVL_GUI_QT4_SUPPORT=ON \
      -DVL_WXWIDGETS_SUPPORT=ON \
      -DVL_INSTALL_DATA=ON \
      -DVL_INSTALL_DOCS=ON \
      -DVL_UNIX_INSTALL_MODE=ON

  make
  make doxygen
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share/doc/vl
  mv $pkgdir/usr/share/vl/docs $pkgdir/usr/share/doc/vl/
  mv $pkgdir/usr/share/vl/README.TXT $pkgdir/usr/share/doc/vl/
  mv $pkgdir/usr/share/vl/LICENSE.TXT $pkgdir/usr/share/doc/vl/
}

# vim:set ts=2 sw=2 et:
