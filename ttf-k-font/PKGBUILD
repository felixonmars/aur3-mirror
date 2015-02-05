# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-k-font
pkgver=1
pkgrel=1
pkgdesc="Japanese font similar to K-ON! logo"
url="http://font.sumomo.ne.jp/"
license=('Apache')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://font.sumomo.ne.jp/fontdata-215741/k-font.zip)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('41cf4027dfafdd4d3da2f46c57611220')
