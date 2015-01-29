# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-honoka-maru-gothic
pkgver=1.1
pkgrel=1
pkgdesc="Japanese font having a nostalgic feel (Rounded Gothic)"
url="http://font.gloomy.jp/"
license=('Apache')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://font.gloomy.jp/dl-font-ajtaerju/honoka-marugo.zip)

package() {
  cd "${srcdir}/honoka-marugo"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('345d8dd5516539dc13053ee14073c598')
