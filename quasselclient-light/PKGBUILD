# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Mike Shade <mshade@mshade.org>
# Contributor: Jochen Schalanda <jochen+aur (-at-) schalanda.name>

pkgname=quasselclient-light
pkgver=0.11.0
pkgrel=1
pkgdesc="Modern, cross-platform, distributed IRC client; built with few dependencies (client only)"
url="http://quassel-irc.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base')
optdepends=('qca-ossl')
makedepends=('cmake')
provides=('quassel' 'quasselclient')
install=quassel.install
conflicts=('quassel' 'quasselclient' 'quassel-git' 'quasselclient-git')
source="${url}/pub/quassel-${pkgver}.tar.bz2"
sha256sums=('99a191b8bc2a410f7020b890ec57e0be49313f539da9f4843675bb108b0f4504')

build() {
  [[ ! -d build ]] && mkdir build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWITH_KDE=OFF \
    -DWITH_WEBKIT=OFF \
    -DWITH_PHONON=OFF \
    -DWITH_LIBINDICATE=OFF \
    -DWITH_OPENSSL=ON \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_CORE=OFF \
    -DWANT_MONO=OFF \
    ../quassel-${pkgver}/ \
    -Wno-dev

  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
