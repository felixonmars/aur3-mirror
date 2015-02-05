# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-nicomoji-plus
pkgver=0.9
pkgrel=1
pkgdesc="Japanese font similar to Niconico logo"
url="http://nicofont.pupu.jp/nicomoji-plus.html"
license=('Apache')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://nicofont.pupu.jp/nicomoji_2525/nicomoji-plus.zip)

package() {
  cd "${srcdir}/nicomoji-plus"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('455dfb18be90d211242dda649760ba07')
