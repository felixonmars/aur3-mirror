# Maintainer:  Martin Peres <martin.peres AT ensi-bourges.fr>

pkgname=ensicopia
pkgver=2.0b1
pkgrel=1
pkgdesc="Ensicopia is a C++/Qt program design for auto-connections to Ucopia, a WiFi authentifications handler."
url="http://projetsti.ensi-bourges.fr/projects/ensicopia"
license=('GPL')
depends=('gcc-libs' 'qt>=4.0')
makedepends=('cmake' 'qt>=4.0')
options=('libtool')
optdepends=('ppasskeeper: Password storing support (install first and then recompile ensicopia)')
arch=('i686' 'x86_64')
install=
source=("http://projetsti.ensi-bourges.fr/attachments/download/5/ensicopia-"$pkgver".tar.gz")
sha1sums=('2e03b877b72d8881f137acc006d09749f86b691a')

build() {
  cd ${srcdir}/ensicopia-$pkgver

  msg "Starting make..."

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}
