# Contributor: George Giorgidze <giorgidze (at) gmail.com>

pkgname=mico
pkgver=2.3.13
pkgrel=2
pkgdesc="MICO is a mature, secure, robust, fully standards-compliant implementation of the CORBA standard"
arch=('i686' 'x86_64')
url="http://www.mico.org/"
license=('GPL')
groups=()
depends=('libxt' 'openssl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.mico.org/${pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('a8e5d5a0e32dba2ef767eb5189f1732a')

build() {
  cd "${srcdir}/${pkgname}"

  sed  --in-place -e '40i\#include <limits.h>' orb/fast_array.cc
  sed  --in-place -e '36s/ demo//' Makefile
  sed  --in-place -e '82d' Makefile

  ./configure --prefix='/usr'
  make
  make INSTDIR="${pkgdir}/usr" SHARED_INSTDIR="${pkgdir}/usr/share" install
}
