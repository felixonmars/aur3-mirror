# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff AT gmail.com>
# Contributor: mosra <mosra@centrum.cz>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=mingw32-qt-static
pkgver=4.8.3
pkgrel=1
pkgdesc="A cross-platform application and UI framework (mingw32)"
arch=('any')
url="http://qt-project.org/"
license=('LGPL')
depends=('mingw32-runtime' 'mingw32-libiconv')
makedepends=('mingw32-gcc')
conflicts=('mingw32-qt')
provides=("mingw32-qt=${pkgver}")
options=(!strip !buildflags !libtool)
source=("http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${pkgver}.tar.gz"
        i486-mingw32-qmake
        qplatformdefs.h
        qmake.conf)
sha1sums=('bc352a283610e0cd2fe0dbedbc45613844090fcb'
          'd1e092fca5f73a53efdb422cc5160b05dbf6add1'
          'cc9cca4d8664d98c98b901b796b648bf0d8f0f7c'
          'df2c456947d5420cf8c88d5e55602bd5d974d986')

build() {
  cd "${srcdir}/qt-everywhere-opensource-src-${pkgver}"

  # The debug build tries to link against libdbus-1d which doesn't exist.
  sed -i 's|-ldbus-1d|-ldbus-1|' src/dbus/dbus.pro

  # Configure script erroneously disables shared memory support with
  # QT_NO_SHAREDMEMORY. Do some hack here.
  sed -i 's|QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_SYSTEMSEMAPHORE QT_NO_SHAREDMEMORY"||' ./configure

  # https://codereview.qt-project.org/34663
  sed -i 's|PKG_CONFIG=no||' ./configure

  mkdir -p mkspecs/win32-g++-cross
  cp ${srcdir}/qplatformdefs.h mkspecs/win32-g++-cross
  cp ${srcdir}/qmake.conf mkspecs/win32-g++-cross

  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset PKG_CONFIG_PATH

  ./configure -confirm-license -opensource \
      -release \
      -prefix /usr/i486-mingw32 \
      -datadir /usr/i486-mingw32/share/qt \
      -static \
      -no-qt3support \
      -verbose \
      -exceptions \
      -fast \
      -confirm-license \
      -force-pkg-config \
      -little-endian \
      -xplatform win32-g++-cross \
      -xmlpatterns \
      -multimedia \
      -audio-backend \
      -webkit \
      -script \
      -scripttools \
      -declarative \
      -no-phonon \
      -qt-libmng \
      -qt-zlib \
      -qt-libtiff \
      -qt-libpng \
      -qt-libjpeg \
      -qt-sql-sqlite \
      -iconv \
      -nomake demos \
      -nomake examples \
      -nomake docs

  make
}

package() {
  cd "${srcdir}/qt-everywhere-opensource-src-${pkgver}"

  make install INSTALL_ROOT=${pkgdir}

  # install qmake
  install -D -m755 bin/qmake ${pkgdir}/usr/i486-mingw32/bin/qmake

  cd "$pkgdir/usr/i486-mingw32"

  # Move plugins to bin/qt-plugins
  mkdir -p bin/qt-plugins
  mv plugins bin/qt-plugins

  # Move imports to bin/qt-imports
  mkdir -p bin/qt-imports
  mv imports bin/qt-imports

  # Install only relevant mkspecs
  rm -r share/qt/mkspecs
  mkdir -p ${pkgdir}/usr/share/qt/mkspecs/win32-g++-cross
  cp ${srcdir}/qplatformdefs.h ${pkgdir}/usr/share/qt/mkspecs/win32-g++-cross
  cp ${srcdir}/qmake.conf ${pkgdir}/usr/share/qt/mkspecs/win32-g++-cross

  # Make default mkspec in cross-environment
  mkdir -p ${pkgdir}/usr/i486-mingw32/share/qt/mkspecs
  cd ${pkgdir}/usr/i486-mingw32/share/qt/mkspecs
  ln -s /usr/share/qt/mkspecs/win32-g++-cross default

  # qmake wrapper
  install -D -m755 ${srcdir}/i486-mingw32-qmake ${pkgdir}/usr/bin/i486-mingw32-qmake
}
