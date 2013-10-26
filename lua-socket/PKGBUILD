# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>

pkgname=lua-socket
_pkgname=luasocket
pkgver=3.0.rc1
_pkgver=3.0-rc1
pkgrel=5
pkgdesc="A comprehensive networking support library for Lua, with IPv6 support (Lua 5.2)"
arch=('i686' 'x86_64')
url="https://github.com/diegonehab/luasocket"
license=('MIT')
makedepends=('lua51')
conflicts=('luasocket-git')
source=("https://github.com/diegonehab/${_pkgname}/archive/v${_pkgver}.tar.gz"
        'makefile.patch'
        'install-headers.patch')
sha256sums=('8b67d9b5b545e1b694753dab7bd6cdbc24c290f2b21ba1e14c77b32817ea1249'
            'ccf9f4d83d6f4d14e8a89af56a33812a7cd0af0604b36dce435cfb9397296cba'
            'a542eec699794bb696e7c598a1c439d1efde3d060c612e4e6af1c37018a3d0e3')

prepare() {
  cd "${srcdir}"
  rm -fr "${pkgname}"
  cp -R "${_pkgname}-${_pkgver}" "${pkgname}"

  cd "${pkgname}"
  patch -p1 -i "${srcdir}/makefile.patch"
  patch -p1 -i "${srcdir}/install-headers.patch"
}

build() {
  cd "${pkgname}"

  make linux LUAV=5.2 LUAPREFIX_linux="/usr" LUAINC_linux="/usr/include/lua5.2"
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" LUAV=5.2 LUAPREFIX_linux="/usr" install-unix install-headers
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

