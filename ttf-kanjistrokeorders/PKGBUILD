# Maintainer : Tushar R <echo dHVzaGFyXzcyN0B5YWhvby5jb20K | base64 -d>
# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>

pkgname=ttf-kanjistrokeorders
pkgver=3.000
pkgrel=1
pkgdesc="Kanji Stroke Order Font"
arch=('any')
url="http://sites.google.com/site/nihilistorguk/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://sites.google.com/site/nihilistorguk/KanjiStrokeOrders_v${pkgver}.zip)
md5sums=('094c3f7ac06d47667f9539f1a27392da')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "KanjiStrokeOrders_v${pkgver}.ttf" \
      "${pkgdir}/usr/share/fonts/TTF"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 copyright.txt \
       "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 *Sample.pdf readme*.txt \
       "${pkgdir}/usr/share/doc/${pkgname}"
}
