# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>

pkgname=lua52-socket
_pkgname=luasocket
pkgver=3.0.rc1
_pkgver=3.0-rc1
pkgrel=1
pkgdesc='A comprehensive networking support library for Lua (ver 5.2), with IPv6 support'
arch=('i686' 'x86_64')
url="https://github.com/diegonehab/luasocket"
license=('MIT')
depends=('lua')
conflicts=('luasocket-git')
source=("https://github.com/diegonehab/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('8b67d9b5b545e1b694753dab7bd6cdbc24c290f2b21ba1e14c77b32817ea1249')

prepare() {
  cd "${srcdir}"
  rm -fr "${pkgname}"
  cp -R "${_pkgname}-${_pkgver}" "${pkgname}"
}

build() {
  cd "${pkgname}"

  make prefix=/usr
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" prefix=/usr install-both-unix
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"

  rm -fr "${pkgdir}/usr/share/lua/5.1" "${pkgdir}/usr/lib/lua/5.1"
}

