# Contributor: Dan Vratil <vratil@progdansoft.com
pkgname=php-qt-svn
pkgver=977313
pkgrel=3
pkgdesc="An extension for PHP5 that aims to write software with the Qt Toolkit."
arch=('x86_64' 'i686')
url="http://www.php-qt.org/"
license=('LGPL')
depends=('php>=5.1' 'qt>=4.0')
makedepends=('subversion' 'cmake' 'qimageblitz' 'kdelibs')
provides=('php-qt')
conflicts=('php-qt')
install=php-qt.install
sources=()

_phpqt_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdebindings/php/phpqt
_phpqt_svnmod=phpqt
_kalyptus_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdebindings/kalyptus
_kalyptus_svnmod=kalyptus
_smoke_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdebindings/smoke
_smoke_svnmod=smoke
_cmake_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdebindings/cmake
_cmake_svnmod=cmake

build() {
  cd "$srcdir"
  msg "Checking out PHPQT..."
  if [ -d $_phpqt_svnmod/.svn ]; then
    (cd $_phpqt_svnmod && svn up -r $pkgver)
  else
    svn co $_phpqt_svntrunk --config-dir ./ -r $pkgver $_phpqt_svnmod
  fi
  
  cd "$srcdir/$_phpqt_svnmod"
  msg "Checking out Smoke..."
  if [ -d $_smoke_svnmod/.svn ]; then
    (cd $_smoke_svnmod && svn up -r $pkgver)
  else
    svn co $_smoke_svntrunk --config-dir ./ -r $pkgver $_smoke_svnmod
  fi

  cd "$srcdir/$_phpqt_svnmod"
  msg "Checking out Kalyptus..."
  if [ -d $_kalyptus_svnmod/.svn ]; then
    (cd $_kalyptus_svnmod && svn up -r $pkgver)
  else
    svn co $_kalyptus_svntrunk --config-dir ./ -r $pkgver $_kalyptus_svnmod
  fi


  cd "$srcdir/$_phpqt_svnmod"
  msg "Checking out CMake include files..."
  if [ -d $_cmake_svnmod/.svn ]; then
    (cd $_cmake_svnmod && svn up -r $pkgver)
  else
    svn co $_cmake_svntrunk --config-dir ./ -r $pkgver $_cmake_svnmod
  fi

  msg "SVN checkout done or server timeout"
  
  # Use php-qt CMakeLists with Smoke support
  cd "$srcdir/$_phpqt_svnmod"
  mv CMakeLists.txt CMakeLists.txt.orig
  mv CMakeLists.txt.php-qt CMakeLists.txt
  
  ln -sv /usr/share/apps/cmake/modules/FindQImageBlitz.cmake $srcdir/phpqt/cmake/modules/FindQImageBlitz.cmake
  ln -sv /usr/share/apps/cmake/modules/FindLibraryWithDebug.cmake $srcdir/phpqt/cmake/modules/FindLibraryWithDebug.cmake
 
  #rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"    
  #
  # BUILD
  #
  
  cmake ../$_phpqt_svnmod \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DQT_QMAKE_EXECUTABLE=$(which qmake) \
	-DQIMAGEBLITZ_INCLUDES=/usr/include/qimageblitz \
	-DQIMAGEBLITZ_LIBRARIES=/usr/lib
	
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
