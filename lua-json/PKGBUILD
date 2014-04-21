# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lua-json
_pkgname=luajson
pkgver=1.3.3
pkgrel=2
pkgdesc='JSON parser/encoder for Lua'
arch=('any')
url='http://luaforge.net/projects/luajson/'
license=('MIT')
depends=('lua-lpeg' 'lua')
checkdepends=('lua-lunit' 'lua-filesystem')
source=("https://github.com/harningt/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('53455f697c3f1d7cc955202062e97bbafbea0779')

prepare() {
  rm -fr build
  cp -R "${_pkgname}-${pkgver}" build
}

check() {
  cd build
  make INSTALL_LMOD='$(INSTALL_TOP)/share/lua/5.2' INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/5.2' check
}

package() {
  cd build
  make PREFIX=/usr DESTDIR="${pkgdir}" INSTALL_LMOD='$(INSTALL_TOP)/share/lua/5.2' INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/5.2' install
}

