# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

_pkgname=fcitx
pkgname=fcitx-wps
pkgdesc='Fcitx QT4 IM Module for WPS'
pkgver=4.2.8.3
_qtver=4.7.4
pkgrel=1
depends=('kingsoft-office' "lib32-fcitx>=$pkgver" "fcitx>=$pkgver")
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL')
makedepends=('cmake' 'lib32-qt4')
_qtsrc="qt-everywhere-opensource-src-${_qtver}"
source=(http://download.fcitx-im.org/fcitx/fcitx-${pkgver}.tar.xz
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

  cd "$srcdir"

  export CC="gcc -m32"
  export CXXFLAGS="$CXXFLAGS -I$srcdir/$_qtsrc/include -I$srcdir/$_qtsrc/include/QtCore -I$srcdir/$_qtsrc/include/QtGui -I$srcdir/$_qtsrc/include/QtDBus"
  export CXX="g++ -m32"

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

  QTDIR=${srcdir}/$_qtsrc/lib cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFORCE_OPENCC=Off \
    -DFORCE_PRESAGE=On \
    -DFORCE_ENCHANT=Off \
    -DENABLE_TEST=Off \
    -DENABLE_GTK2_IM_MODULE=Off \
    -DENABLE_GTK3_IM_MODULE=Off \
    -DENABLE_QT_IM_MODULE=ON \
    -DWPS_QT_INSTALL_PLUGINS=/opt/kingsoft/wps-office/office6/qt/plugins \
    -DWPS_QTVERSION=4.7.4 \
    -DWPS_QMAKE_MKSPECS="$srcdir/$_qtsrc/mkspecs" \
    -DWPS_QT_INSTALL_LIBS=${srcdir}/$_qtsrc/lib \
    -DWPS_QT_INSTALL_BINS=${srcdir}/$_qtsrc/bin
    #-DWPS_QT_INSTALL_IMPORTS=

  cd "${srcdir}/build/src/frontend/qt"
  make VERBOSE=1

  cd "${srcdir}/build/src/lib"
  make
}

package() {
  cd "${srcdir}/build/src/frontend/qt"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/build/src/lib"
  install -m755 fcitx-qt/libfcitx-qt.so* "$pkgdir/opt/kingsoft/wps-office/office6/"
}

md5sums=('a16f7056158b5b0ee1eeae0d92346300'
         '9831cf1dfa8d0689a06c2c54c5c65aaf'
         'f1ebde541542e36eea01f8ebacb8cdc4')
