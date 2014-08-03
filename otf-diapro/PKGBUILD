# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=otf-diapro
pkgver=1
pkgrel=1
pkgdesc="A timetable-ish font"
arch=('any')
url="http://but.tw/font/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://but.tw/font/files/DiaPro.zip)

package() {
  cd ${srcdir}

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Readme.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('b72edde93bc8da5dfacc6405d295c6b9')
