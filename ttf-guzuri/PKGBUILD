# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-guzuri
pkgver=1
pkgrel=1
pkgdesc="Japanese font by a first grader"
url="http://sukuranburu.net/"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://sukuranburu.net/guzuri_1nensei.zip)

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}

md5sums=('41fbf90cf8e9e76355c2a1258d9966cf')
