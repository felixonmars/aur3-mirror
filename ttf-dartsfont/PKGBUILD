# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-dartsfont
pkgver=1
pkgrel=1
pkgdesc="A Japanese font"
url="http://www.p-darts.jp/font/dartsfont/"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.p-darts.jp/items/fonts/dartsfont.zip)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/dartsfont.ttf"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('e4ed7a1e3fcb25f78cb51d5fd8bc04c6')
