# Maintainer:

pkgname=lua51-json
_pkgname=luajson
pkgver=1.3.2
pkgrel=1
pkgdesc='JSON parser/encoder for Lua (5.1)'
arch=('any')
url='http://luaforge.net/projects/luajson/'
license=('MIT')
depends=('lua51-lpeg')
source=("https://github.com/harningt/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('21debd20c8abd110a29b9f987b919466')

prepare() {
  cd "${srcdir}"
  rm -fr "${_pkgname}"
  cp -R "${_pkgname}-${pkgver}" "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
