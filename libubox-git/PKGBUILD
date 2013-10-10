# Maintainer: Alexander Couzens <lynxis[at]fe80[dot]eu>
_pkgname=libubox
pkgname=$_pkgname-git
pkgver=20131010
pkgrel=3
pkgdesc="A small utility library developed for OpenWrt containing a event loop, linked lists, blobmsg, stream buffer management, [...]"
arch=('x86_64' 'i686')
url="http://openwrt.org"
license=('ISC BSD-3c')
depends=('json-c')
makedepends=('git' 'cmake' 'gcc' 'make')
optdepends=()
provides=(${_pkgname})
conflicts=()
replaces=()
backup=()
source=("$pkgname"::'git://nbd.name/luci2/libubox.git')
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_LUA=OFF -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
