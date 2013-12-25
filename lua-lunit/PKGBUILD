# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lua-lunit
_pkgname=lunit
pkgver=0.5
pkgrel=1
pkgdesc='Unit test for Lua'
arch=('any')
url="http://www.mroth.net/lunit"
license=('MIT')
depends=('lua' 'bash')
source=("http://www.mroth.net/lunit/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE')
sha1sums=('7a7cfddab10836f9ed16574be6a450a63a5d4be7'
          'e471a511997528dd080d2997580499c37d06111a')

prepare() {
  rm -fr "${pkgname}"
  cp -R "${_pkgname}-${pkgver}" "${pkgname}"
}

package() {
  cd "${pkgname}"
  install -Dm644 lunit-console.lua "${pkgdir}/usr/share/lua/5.2/lunit-console.lua"
  install -Dm644 lunit.lua "${pkgdir}/usr/share/lua/5.2/lunit.lua"
  install -Dm755 lunit "${pkgdir}/usr/bin/lunit"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
