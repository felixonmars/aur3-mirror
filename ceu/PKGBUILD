# Maintainer: Tim Cooper <tim.cooper@layeh.com>
pkgname=ceu
pkgver=0.8
pkgrel=1
pkgdesc="Céu is a reactive language that aims to offer a higher-level and safer alternative to C."
url="http://www.ceu-lang.org/"
arch=("x86_64" "i686")
license=("MIT")
depends=("lua51" "lua51-lpeg")
source=("https://github.com/fsantanna/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("ccec30e35886a5692c94c5d073024c07")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  lua5.1 pak.lua
  sed -i '1s/lua/lua5.1/' ceu
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 ceu "${pkgdir}/usr/bin/ceu"
  install -Dm644 manual/manual.md "${pkgdir}/usr/share/doc/${pkgname}/manual.md"
}
