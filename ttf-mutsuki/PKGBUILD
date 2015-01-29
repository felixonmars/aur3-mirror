# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-mutsuki
pkgver=1
pkgrel=1
pkgdesc="Mincho-style font like old letterpress printing"
url="http://mandel59.github.io/mutsuki/"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://mandel59.github.io/mutsuki/Mutsuki.ttf https://raw.githubusercontent.com/mandel59/mutsuki/master/LICENSE)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('84a9e8a6edba162292983ed3aefe2cd6'
         '55879e6feb893e64f37d2a739995ca76')
