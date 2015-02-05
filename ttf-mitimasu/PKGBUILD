# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-mitimasu
pkgver=1
pkgrel=1
pkgdesc="A Japanese font"
url="http://www.masuseki.com/index.php?u=my_works/121003_mitimasu.htm"
license=('MIT')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.masuseki.com/works/mitimasu.zip)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 readme.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('5e99e72307a0fa5e51dfa4aca280f53d')
