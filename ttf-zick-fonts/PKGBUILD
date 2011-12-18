# Maintainer: Jonathan Rascher <jon at bcat.name>
pkgname=ttf-zick-fonts
pkgver=20110508
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Several free fonts by Brian M. Zick"
arch=('any')
url="http://luc.devroye.org/zick.html"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
source=(http://luc.devroye.org/zick-fonts.zip)
install=$pkgname.install
md5sums=('7833ba06f3ab998417936f84ce5a340f')

build() {
  cd "${srcdir}" || return 1
  install -dm755 "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" || return 1
}

# vim:set ts=2 sw=2 et:
