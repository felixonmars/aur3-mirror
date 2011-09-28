# $Id$
# Maintainer: Sagar Chalise <chalisesagar@gmail.com>

pkgname=ltk-nepali-fonts
pkgver=1.0
pkgrel=1
_pkgver=1_0
_date=2011_09_26
pkgdesc="Nepali Fonts Provided by Language Technology Kendra"
arch=('any')
url="http://ltk.org.np/downloads.php"
license=('GPL3')
depends=('fontconfig' 'unrar')
source=("http://www.ltk.org.np/downloads/fonts.rar")
install=ltk-nepali-fonts.install
md5sums=('278cbebf4d222972f1f9482f4505d9df')

build() {
  cd "${srcdir}"
  unrar e fonts.rar
}

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
