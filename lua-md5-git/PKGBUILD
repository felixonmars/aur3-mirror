# Contributor: Philipp Gesang <phg42.2a@gmail.com>
# Contributor of original lua-md5 PKGBUILD: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lua-md5-git
pkgver=1.1.2
pkgrel=1
pkgdesc="Basic cryptographic facilities for Lua 5.2"
arch=("i686" "x86_64")
url="https://github.com/keplerproject/md5"
license=("MIT")
depends=("lua")
makedepends=("git")
source=("git://github.com/keplerproject/md5.git" "LICENSE")
md5sums=("SKIP" "9ac505254abc686b34763c2118dc2e1b")

build() {
  cd ${srcdir}/md5
  ./configure
  make
}

package() {
  cd ${srcdir}/md5
  sed -i "s|\$(LUA_LIBDIR)|${pkgdir}/\$(LUA_LIBDIR)|" Makefile
  sed -i "s|\$(LUA_DIR)|${pkgdir}/\$(LUA_DIR)|"       Makefile
  sed -i "s|\(LUA_LIBDIR=.*\)5.1|\15.2|" config
  sed -i "s|\(LUA_DIR=.*\)5.1|\15.2|"    config
  sed -i "s|LUA_VERSION_NUM= 501|LUA_VERSION_NUM= 502|" config
  make install
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:ts=2:sw=2:expandtab
