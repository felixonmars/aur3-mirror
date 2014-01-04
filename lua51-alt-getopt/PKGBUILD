# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# contributor: Cameron Banta <cbanta@gmail.com>

pkgname=lua51-alt-getopt
_pkgname=lua-alt-getopt
pkgver=0.7.0
pkgrel=3
pkgdesc="Lua module for processing options similar to getopt_long(3) (5.1)"
license=('MIT')
arch="any"
url="http://luaforge.net/projects/alt-getopt/"
depends=('lua51')
source=("http://mova.org/~cheusov/pub/lua_alt_getopt/lua-alt-getopt-${pkgver}.tar.gz"
        'LICENSE')
sha1sums=('431b590002f5fdced78e0745a9a283aefdd1dfa0'
          'e471a511997528dd080d2997580499c37d06111a')

prepare() {
  rm -fr build
  cp -r "${_pkgname}-${pkgver}" build
  cd build

  sed 's|#!/usr/bin/env lua|#!/usr/bin/env lua5.1|g' -i alt_getopt
}

package() {
  cd build
  install -Dm755 alt_getopt "${pkgdir}/usr/bin/alt_getopt5.1"
  install -Dm664 alt_getopt.lua "${pkgdir}/usr/share/lua/5.1/alt_getopt.lua"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
