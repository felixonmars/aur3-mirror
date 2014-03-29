# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=otf-amatanoyoru
pkgver=1
pkgrel=1
pkgdesc="A writing brush Japanese font"
arch=('any')
url="http://banban-font.com/products/amata-no-yoru/"
license=('custom:Public Domain')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://banban-font.com/images/amatanoyoru.zip)

package() {
  cd ${srcdir}

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Readme.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('71a29f6443f003b6c2eed18029c065c3')
