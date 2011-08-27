# Maintainer: Dwight Schauer <dschauer@gmail.com>
pkgname=lua-oil
_pkgname=oil
pkgver=0.5
pkgrel=4
pkgdesc="An Object Request Broker in Lua"
arch=(i686 x86_64)
url="http://www.tecgraf.puc-rio.br/~maia/oil/index.html"
license=('MIT')
groups=()
depends=('lua64>=5.1')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.tecgraf.puc-rio.br/~maia/oil/${_pkgname}-${pkgver}.tar.gz)
noextract=()

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  echo Patching config
  sed \
    -e 's,LUA_HOME= /usr/local,LUA_HOME= /usr,' \
    -e 's,INSTALL_TOP= $(LUA_HOME),INSTALL_TOP= /usr,' \
    -e 's,CFLAGS=,CFLAGS= -DLNUM_INT64,' \
    -i config

  echo Patching Makefile
  sed \
    -e 's,$(INSTALL_LIB)$,'${pkgdir}'$(INSTALL_LIB),' \
    -e 's,$(INSTALL_INC)$,'${pkgdir}'$(INSTALL_INC),' \
    -e 's,$(INSTALL_LMOD)$,'${pkgdir}'$(INSTALL_LMOD),' \
    -e 's,cd $(INSTALL_LIB);,cd '${pkgdir}'$(INSTALL_LIB);,' \
    -e 's,cd $(INSTALL_CMOD);,cd '${pkgdir}'$(INSTALL_CMOD);,' \
    -e 's,cd $(INSTALL_CMOD)/socket;,cd '${pkgdir}'$(INSTALL_CMOD)/socket;,' \
    -e 's,cd $(INSTALL_CMOD)/oil.*;,cd '${pkgdir}'$(INSTALL_CMOD)/oil;,' \
    -e 's,mkdir -p $@$,mkdir -p '${pkgdir}'$@,' \
    -i Makefile

  echo Creating directories
  mkdir -p ${pkgdir}/usr/share/lua/5.1
  mkdir -p ${pkgdir}/usr/include
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/lib/lua/5.1/oil
  mkdir -p ${pkgdir}/usr/lib/lua/5.1/socket

  make -j1 linux
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make install
}
sha256sums=('7c6fcd425b5514b00fe9bdba63e357c1430de0e3612c01e7f3e24d17270b09b8')

# vim:set ts=2 sw=2 et:
