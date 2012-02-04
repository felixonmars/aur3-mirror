# Maintainer: Jontahan Liu <net147@gmail.com>
pkgname=qt46
pkgver=4.6.3
pkgrel=1
pkgdesc='A cross-platform application and UI framework'
arch=('i686' 'x86_64')
url='http://qt.nokia.com/'
license=('GPL3' 'LGPL')
depends=('libpng' 'fontconfig' 'libtiff' 'libmng' 'sqlite3' 'xdg-utils' 'ca-certificates'
         'hicolor-icon-theme' 'alsa-lib' 'glib2' 'dbus' 'libxrender' 'libgl' 'libsm')
optdepends=('postgresql-libs' 'libmysqlclient' 'unixodbc')
makedepends=('mesa' 'inputproto' 'postgresql-libs' 'mysql' 'unixodbc' 'cups' 'libxfixes' 'gtk2')
options=('!libtool')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("ftp://ftp.qt.nokia.com/qt/source/${_pkgfqn}.tar.gz"
        'ca-certificates.patch')
md5sums=('5c69f16d452b0bb3d44bc3c10556c072'
         'd5c4cad7af93f1d736d4569a207bd739')

build() {
  unset QMAKESPEC
  export QT4DIR="$srcdir/$_pkgfqn"
  export PATH="${QT4DIR}/bin:${PATH}"
  export LD_LIBRARY_PATH="${QT4DIR}/lib:${LD_LIBRARY_PATH}"

  cd "$srcdir/$_pkgfqn"

  # see http://cvs.fedoraproject.org/viewvc/rpms/qt/devel/
  # use system ssl cert bundle
  patch -p1 -i "$srcdir/ca-certificates.patch"

  sed -i "s|-O2|$CXXFLAGS|" mkspecs/common/g++.conf
  sed -i "/^QMAKE_RPATH/s| -Wl,-rpath,||g" mkspecs/common/g++.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" mkspecs/common/g++.conf

  ./configure -confirm-license -opensource \
    -prefix /opt/qt46 \
    -largefile \
    -plugin-sql-{psql,mysql,sqlite,odbc} \
    -system-sqlite \
    -xmlpatterns \
    -no-phonon \
    -no-phonon-backend \
    -svg \
    -webkit \
    -scripttools \
    -system-zlib \
    -system-libtiff \
    -system-libpng \
    -system-libmng \
    -system-libjpeg \
    -openssl-linked \
    -nomake demos \
    -nomake examples \
    -nomake docs \
    -nomake tools \
    -no-rpath \
    -silent \
    -optimized-qmake \
    -dbus \
    -no-separate-debug-info \
    -reduce-relocations \
    -gtkstyle \
    -opengl \
    -no-openvg \
    -glib
  make
}

package() {
  cd "$srcdir/$_pkgfqn"
  make INSTALL_ROOT="$pkgdir" install

  # install license addition
  install -D -m644 LGPL_EXCEPTION.txt "${pkgdir}/usr/share/licenses/$pkgname/LGPL_EXCEPTION.txt"

  # Fix wrong path in pkgconfig files
  find "${pkgdir}/opt/$pkgname/lib/pkgconfig" -type f -name '*.pc' \
    -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;
  # Remove build dir from prl files
  find "${pkgdir}/opt/$pkgname/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}

# vim:set ts=2 sw=2 et:
