# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-magicring
pkgver=1.01
pkgrel=1
pkgdesc="Magic circle pattern font"
url="http://inatsuka.hp2.jp/extra/magicring/"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://inatsuka.hp2.jp/extra/magicring/magicring.zip)

package() {
  cd "${srcdir}/magicring"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 readme.txt "${pkgdir}/usr/share/licenses/${pkgname}/readme.txt"
}

md5sums=('2c0c3e90b3b5e33e685143f3117baa4b')
