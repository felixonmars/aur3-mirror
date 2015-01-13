# $Id$
# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=cmetronome
pkgver=0.1.0
pkgrel=1
pkgdesc="Command line metronome"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/utils/cmetronome"
license=('LGPLv2')
depends=('pulseaudio')
makedepends=('cmake')
#install=cmetronome.install
source=(http://download.kde.org/unstable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.xz)
sha1sums=('d3f20c96abec8e46846b679d2aefeb30c18e98a1')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
    install -Dm 0755 ${srcdir}/build/cmetronome ${pkgdir}/usr/bin/cmetronome
}
