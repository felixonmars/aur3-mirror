# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=libopensync-plugin-gpe
pkgver=0.36
pkgrel=1
pkgdesc="OpenSync plugin for the Gnome Palmtop Environment"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL')
depends=('libopensync')
makedepends=('cmake')
options=(!libtool)
source=(http://www.opensync.org/download/releases/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a0d6bc631beacaaf324b97daaa27042d')

build() {
  cd ${startdir}/src/
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

# vim:set ts=2 sw=2 et:
