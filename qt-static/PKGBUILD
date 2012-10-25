# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=qt-static
pkgver=4.8.3
pkgrel=1
pkgdesc='A cross-platform application and UI framework (static)'
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL')
depends=('gcc-libs' 'bash')
options=('!libtool')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://releases.qt-project.org/qt4/source/${_pkgfqn}.tar.gz"
        'qmake-static')
md5sums=('a663b6c875f8d7caa8ac9c30e4a4ec3b'
         'ea0914ee23bfd2f461d4fc8655a1db92')

build() {
  cd "${srcdir}"/${_pkgfqn}

  export QT4DIR="${srcdir}"/${_pkgfqn}
  export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

  sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/g++-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" mkspecs/common/gcc-base.conf

  ./configure -confirm-license -opensource \
    -prefix /opt/qt-static \
    -qt-sql-sqlite \
    -no-phonon \
    -no-phonon-backend \
    -no-webkit \
    -graphicssystem raster \
    -qt-zlib \
    -qt-libtiff \
    -qt-libpng \
    -qt-libmng \
    -qt-libjpeg \
    -nomake demos \
    -nomake examples \
    -nomake docs \
    -nomake tools \
    -nomake translations \
    -openssl \
    -silent \
    -no-rpath \
    -optimized-qmake \
    -dbus \
    -reduce-relocations \
    -no-gtkstyle \
    -no-opengl \
    -no-openvg \
    -no-glib \
    -static \
    -qpa
  make
}

package() {
    cd "${srcdir}"/${_pkgfqn}

    make INSTALL_ROOT="${pkgdir}" install

    # Fix wrong path in prl files
    find "${pkgdir}/opt/qt-static/lib" -type f -name '*.prl' \
        -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
    
    install -Dm755 $srcdir/qmake-static $pkgdir/usr/bin/qmake-static
}
