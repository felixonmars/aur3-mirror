# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

_pkgbase=transmission
pkgname=${_pkgbase}-qt4
pkgver=2.84
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (Qt GUI)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'qt4' 'libevent')
makedepends=('gtk3' 'intltool' 'curl' 'qt4' 'libevent')
optdepends=('transmission-cli: daemon and web support')
provides=('transmission-qt')
conflicts=('transmission-qt')
install=transmission-qt.install
source=(http://mirrors.m0k.org/transmission/files/${_pkgbase}-${pkgver}.tar.xz
        "qt4-c++11.patch")
sha256sums=('a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb'
            'cf0a6edd348da3d2d21dd7486084b67b8ae2b073c0d9699688591e17853dd15c')

prepare() {
  cd ${_pkgbase}-${pkgver}

  patch -Np0 -i "${srcdir}/qt4-c++11.patch"
}

build() {
  cd ${_pkgbase}-${pkgver}

  ./configure --prefix=/usr
  make
  pushd qt
  qmake-qt4 qtr.pro
  make QMAKE_CXXFLAGS+=-std=c++11
}

package() {
  cd ${_pkgbase}-${pkgver}

  make -C qt INSTALL_ROOT="${pkgdir}"/usr install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/transmission-qt/COPYING"
  install -D -m644 qt/icons/transmission.png "${pkgdir}/usr/share/pixmaps/transmission-qt.png"
  install -D -m644 qt/transmission-qt.desktop "${pkgdir}/usr/share/applications/transmission-qt.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
