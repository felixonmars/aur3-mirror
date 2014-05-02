# Maintainer: Gabriel B. Casella <gbc921@gmail.com>

pkgname=ttf-century-gothic
pkgver=1.0
pkgrel=1
pkgdesc="TrueType Century Gothic font"
arch=('any')
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
url=("http://fontsforweb.com/font/show/?id=9785")
source=("gothic.ttf::https://github.com/gbc921/aur/blob/master/submitted/ttf-century-gothic/gothic.ttf?raw=trueF")
install=$pkgname.install

sha256sums=('3b54cdf8a8e2406791f917a78990e56624d47da88a3d4de0360a3a225720bd70')

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -m644 gothic.ttf "${pkgdir}"/usr/share/fonts/TTF
}

# vim:set ts=2 sw=2 et:
