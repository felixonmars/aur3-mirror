# Maintainer: Jonathan Rascher <jon at bcat.name>
pkgname=ttf-segan-light
pkgver=2.0b
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A nice, thin font designed by Rodney Rogers"
arch=('any')
url="http://www.dafont.com/segan.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://img.dafont.com/dl/?f=segan
        LICENSE)
install=$pkgname.install
md5sums=('e460db1039069552cc70efd77298abb9'
         '91775621d2627bb5528da84919794b32')

build() {
  cd "${srcdir}" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" || return 1
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}" || return 1
}

# vim:set ts=2 sw=2 et:
