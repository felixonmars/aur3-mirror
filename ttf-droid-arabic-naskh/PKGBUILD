# Maintainer: Hassan Zamani <hsn.zmani gmail com>

pkgname=ttf-droid-arabic-naskh
pkgver=1.00
pkgrel=1
pkgdesc="Droid Arabic Naskh is an Arabic/Farsi type designed for use in Google products"
arch=('any')
url="http://www.farsiweb.ir/"
license=('Apache')
depends=('fontconfig' 'xorg-fonts-encodings')
install=ttf.install
source=(http://themes.googleusercontent.com/static/fonts/earlyaccess/droidarabicnaskh/v4/download.zip)
md5sums=('4f9c6b2af49d4bb6007a97bdd70929c3')

package() {
  cd "${srcdir}"

  install -m755 -d "${pkgdir}/usr/share/fonts/truetype/${pkgname}/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/truetype/${pkgname}/" || return 1
}
