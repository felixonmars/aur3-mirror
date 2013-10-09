# Maintainer: Amirhossein Goodarzi <amir007ag gmail com>

pkgname=ttf-droid-arabic-kufi
pkgver=1.00
pkgrel=1
pkgdesc="Droid Arabic Kufi is an Arabic/Farsi type designed for use in Google products such as Google ChromeOS and Android"
arch=('any')
url="http://www.google.com/fonts/earlyaccess"
license=('Apache')
depends=('fontconfig' 'xorg-fonts-encodings')
install=ttf.install
source=(http://themes.googleusercontent.com/static/fonts/earlyaccess/droidarabickufi/v3/download.zip)
md5sums=('0f634649afe458dd690ff7eaccab1387')

package() {
  cd "${srcdir}"

  install -m755 -d "${pkgdir}/usr/share/fonts/truetype/${pkgname}/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/truetype/${pkgname}/" || return 1
}
