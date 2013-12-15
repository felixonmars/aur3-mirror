# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: xduugu

_pkgname=qtcurve
pkgname=qtcurve-wps
pkgdesc='A configurable set of widget styles for WPS'
pkgver=1.8.17
_qtver=4.7.4
pkgrel=1
depends=('kingsoft-office' 'lib32-qtcurve-utils')
arch=('i686' 'x86_64')
url="https://github.com/QtCurve/qtcurve"
license=('GPL')
makedepends=('cmake' 'lib32-qt4')
_qtsrc="qt-everywhere-opensource-src-${_qtver}"
source=($url/archive/${pkgver}.tar.gz
        ftp://ftp.qt-project.org/qt/source/${_qtsrc}.tar.gz
        FindQt4.cmake)

build() {
  cd $_qtsrc
  export QT4DIR=$srcdir/$_qtsrc
  export PATH=${QT4DIR}/bin:${PATH}
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  sed -e "s|-O2|$CXXFLAGS -m32|" \
      -e "/^QMAKE_RPATH/s| -Wl,-rpath,||g" \
      -e "/^QMAKE_LINK\s/s|g++|g++ -m32|g" \
      -e "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" \
      -i mkspecs/common/g++.conf

  ./configure -confirm-license -opensource -v -platform linux-g++-32 \
    -prefix /usr \
    -libdir /usr/lib32 \
    -plugindir /usr/lib32/qt/plugins \
    -importdir /usr/lib32/qt/imports \
    -datadir /usr/share/qt \
    -translationdir /usr/share/qt/translations \
    -sysconfdir /etc \
    -largefile \
    -system-sqlite \
    -xmlpatterns \
    -no-phonon \
    -no-phonon-backend \
    -svg \
    -webkit \
    -script \
    -scripttools \
    -system-zlib \
    -system-libtiff \
    -system-libpng \
    -system-libmng \
    -system-libjpeg \
    -nomake demos \
    -nomake examples \
    -nomake docs \
    -nomake tools \
    -no-rpath \
    -openssl-linked \
    -optimized-qmake \
    -dbus \
    -reduce-relocations \
    -no-separate-debug-info \
    -gtkstyle \
    -opengl \
    -no-openvg \
    -glib
  
  make

  cd ${QT4DIR}/bin
  ln -sf qmake qmake-qt4
  ln -sf automoc automoc4

  cd "$srcdir"

  export CC="gcc -m32"
  export CXXFLAGS="$CXXFLAGS -I$srcdir/$_qtsrc/include -I$srcdir/$_qtsrc/include/QtCore -I$srcdir/$_qtsrc/include/QtGui -I$srcdir/$_qtsrc/include/QtDBus -I$srcdir/$_qtsrc/include/QtSvg -DQT_NO_DEBUG"
  export CXX="g++ -m32"

  mkdir -p "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "$srcdir/FindQt4.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/CheckCXXSymbolExists.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/MacroAddFileDependencies.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/Qt4ConfigDependentSettings.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/Qt4Macros.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/CMakeParseArguments.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"
  ln -sf "/usr/share/cmake-2.8/Modules/FindPackageMessage.cmake" "$srcdir/$_pkgname-$pkgver/cmake/"

  mkdir -p build
  cd build

  QTDIR=${srcdir}/$_qtsrc/lib cmake ../qtcurve-$pkgver -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_PLUGINS_DIR=/opt/kingsoft/wps-office/office6/qt/plugins \
    -DQT_LIBRARY_DIR=${srcdir}/$_qtsrc/lib \
    -DLIB_INSTALL_DIR=/opt/kingsoft/wps-office/office6 \
    -DQTC_KDE4_PREFIX=/usr \
    -DWPS_QT_INSTALL_PLUGINS=/opt/kingsoft/wps-office/office6/qt/plugins \
    -DWPS_QTVERSION=$_qtver \
    -DWPS_QMAKE_MKSPECS="$srcdir/$_qtsrc/mkspecs" \
    -DWPS_QT_INSTALL_LIBS=${srcdir}/$_qtsrc/lib \
    -DWPS_QT_INSTALL_BINS=${srcdir}/$_qtsrc/bin \
    -DQTC_QT4_ENABLE_KDE=false \
    -DENABLE_GTK2=false \
    -DENABLE_QT5=false

  make
}

package() {
  cd build/qt4
  make DESTDIR="${pkgdir}" install

  install -Dm755 "$srcdir"/$_qtsrc/lib/libQtSvg.so* "$pkgdir"/opt/kingsoft/wps-office/office6/
}

md5sums=('c4f2e9bc296398b42bfc132b88a3b989'
         '9831cf1dfa8d0689a06c2c54c5c65aaf'
         'f1ebde541542e36eea01f8ebacb8cdc4')
