# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=ttf-raleway-font-family
pkgver=3.0
pkgrel=1
pkgdesc="Matt McInerney's Raleway family"
arch=(any)
url="http://theleagueofmoveabletype.com/raleway"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-raleway')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-100-source.zip")
md5sums=('fd753c68236f5c712a89bb798a90c4a1')

package() {
  cd ${srcdir}/r*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/raleway"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/raleway"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
