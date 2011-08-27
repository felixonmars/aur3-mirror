# Contributor: Dario Freddi <drf54321@gmail.com>
pkgname=policonnect
pkgver=0.1.1
pkgrel=1
pkgdesc="Wicd template generator for polimi internet connection"
arch=('i686' 'x86_64')
url="http://www.asi.polimi.it"
license=('GPL')
depends=('qt' 'polkit-qt' 'openssl')
makedepends=('gcc' 'cmake' 'automoc4' 'pkgconfig')
source=(http://github.com/drf/policonnect/tarball/v${pkgver})

build() {
  cd ${startdir}/src/drf-policonnect-e830ac86ca8bac16549a7355d674acb44c26f122
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}

