pkgname=lua-event
_pkgname=luaevent
pkgver=0.4.3
pkgrel=1
pkgdesc="libevent binding for Lua"
arch=('i686' 'x86_64')
url="https://github.com/harningt/luaevent"
license=('LGPL2.1')
makedepends=('lua' 'lua-socket')
depends=('libevent>=1.4')
source=("https://github.com/harningt/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3d0efc3d3751fddecedba0c25e0652df')

prepare() {
  cd "${srcdir}"
  rm -fr "${pkgname}"
  cp -R "${_pkgname}-${pkgver}" "${pkgname}"
}

build() {
  cd "${pkgname}"
  make LUA_INC_DIR=/usr/include/lua5.2
}

package() {
  cd "${pkgname}"
  make INSTALL_DIR_BIN='/usr/lib/lua/5.2' \
       INSTALL_DIR_LUA='/usr/share/lua/5.2' \
       DESTDIR="${pkgdir}" \
       install
}


