# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-gebamoji
pkgver=b1
pkgrel=1
pkgdesc="A Japanese font based on Gebaji used by Japanese New Left"
url="http://gebamoji.org/~moyu/archive/economist.htm"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://gebamoji.org/~moyu/archive/geba-${pkgver}.500.zip LICENSE)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('362856fb60f7fdd4c4ea72c246a56b87'
         '39ed150cbc2dc96400135ed28746fe94')
