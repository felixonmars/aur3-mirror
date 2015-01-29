# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-honoka-mincho
pkgver=1
pkgrel=1
pkgdesc="Japanese font having a nostalgic feel (Mincho)"
url="http://font.gloomy.jp/"
license=('Apache')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://font.gloomy.jp/dl-font-ajtaerju/honoka-min.zip)

package() {
  cd "${srcdir}/honoka-min"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('59104f46159eda7f4eaedfe4e3d0a61f')
