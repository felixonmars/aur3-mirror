# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Rex Dieter <rdieter@fedoraproject.org>
# Maintainer: Antonis G. <capoiosct@gmail.org>

pkgname=compat-telepathy-qt
_pkgname=telepathy-qt
pkgver=0.9.3
pkgrel=3
pkgdesc="A library for Qt-based Telepathy clients"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/wiki/"
license=('LGPL')
options=('!libtool')
depends=('qt4' 'compat-telepathy-farstream' 'gstreamer0.10-base' 'farstream-0.1' 'dbus-python')
makedepends=('libxslt' 'python2' 'cmake' 'doxygen')
conflicts=('telepathy-qt4' 'telepathy-qt')
replaces=('telepathy-qt4' 'telepathy-qt')
provides=('telepathy-qt4' 'telepathy-qt')
source=("http://telepathy.freedesktop.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        'telepathy-qt-0.9.3-farstream_compat.patch')
md5sums=('94ac93aedf5f6fff49837bc8368e5a37'
         'e1b851b08b159fca39596ff8395ca53a'
         'f47dcb67e554376080e02f08716dc703')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}"/telepathy-qt-0.9.3-farstream_compat.patch
    cd ../

    mkdir build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DENABLE_TESTS=OFF \
        -DENABLE_FARSIGHT=OFF
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
