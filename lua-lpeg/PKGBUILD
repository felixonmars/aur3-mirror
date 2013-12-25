# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lua-lpeg
_pkgname=lpeg
pkgver=0.12
pkgrel=1
pkgdesc='Pattern-matching library for Lua'
arch=('i686' 'x86_64')
url="http://www.inf.puc-rio.br/~roberto/lpeg"
license=('MIT')
depends=('lua')
conflicts=('lpeg')
source=("http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-${pkgver}.tar.gz"
        'http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-lua/lpeg/files/lpeg-0.12-makefile.patch'
        'LICENSE')
sha1sums=('a75233c73b75f7e51e25ee67bba4de9fb0433b23'
          'a1245ecc278331cb61fc0267d6cd2f926985da88'
          'e471a511997528dd080d2997580499c37d06111a')

prepare() {
  rm -fr "${pkgname}"
  cp -R "${_pkgname}-${pkgver}" "${pkgname}"
  cd "${pkgname}"
  patch -p1 -i "${srcdir}/lpeg-0.12-makefile.patch"
}

build() {
  cd "${pkgname}"
  make LUADIR=/usr/include/lua5.2
}

package() {
  cd "${pkgname}"
  install -Dm755 lpeg.so "${pkgdir}/usr/lib/lua/5.2/lpeg.so"
  install -Dm644 re.lua "${pkgdir}/usr/share/lua/5.2/re.lua"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
