# Maintainer: Nathan Hodgson <nathanrmh@gmail.com>

pkgname=ttf-lato-fonts
pkgver=1.104
pkgrel=1
pkgdesc='Quality open-source fonts.'
arch=(any)
url='http://www.latofonts.com/'
license=('custom:"OFL"')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://www.latofonts.com/download/LatoOFL.zip)
md5sums=('7eb15c470538a2389db0637cbfda2bf3')

build() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
  install -D -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -D -m644 OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LISENSE"
}

# vim:set ts=2 sw=2 et:

