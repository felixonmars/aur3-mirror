# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=otf-f910-shin-comic
pkgver=2
pkgrel=1
pkgdesc="A Japanese font based on Source Han Sans for comics (Antique-Style)"
url="http://www.font910.jp/font-list/conposite-comic.html"
license=('Apache')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://www.font910.jp/freefont_i6wiwk5/f910-shin-comic-${pkgver}.zip)

package() {
  cd "${srcdir}/f910-shin-comic-${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('6cf0508a008f6c5093f601583593d676')
