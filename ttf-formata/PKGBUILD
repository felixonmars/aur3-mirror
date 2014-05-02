# Maintainer: Gabriel B. Casella <gbc921@gmail.com>

pkgname=ttf-formata
pkgver=1.0
pkgrel=1
pkgdesc="TrueType Formata font"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
url=("http://www.fonts.com/font/berthold/formata-bq")
source=("formata.tar.gz::https://github.com/gbc921/aur/blob/master/submitted/ttf-formata/formata.tar.gz?raw=true")
install=$pkgname.install

sha256sums=('22dedac13bdb01919dd88dfb2bb3a79b7a790f9a6a554808bb8391e743d40d7a')

package() {
  cd "${srcdir}/formata"
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -m644 Formata-Bold.ttf "${pkgdir}"/usr/share/fonts/TTF
  install -m644 Formata-*.otf "${pkgdir}"/usr/share/fonts/TTF
}

# vim:set ts=2 sw=2 et:
