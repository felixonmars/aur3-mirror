# Maintainer: Milos Pejovic <pejovic@gmail.com>

pkgname=ttf-adamant-bg
pkgver=1.0
pkgrel=1
pkgdesc="Serif OpenType Unicode font with Serbian style cyrillic cursive letters"
arch=('any')
license=('custom')
url="http://www.tipometar.org/aktuelno/akcija!/AdamantBG/Index.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=adamant.install
source=(http://www.tipometar.org/aktuelno/akcija!/AdamantBG/img/Adamant%20BG%20OTF.zip
http://www.tipometar.org/aktuelno/akcija!/AdamantBG/img/Adamant%20BG%20TTF.zip)
md5sums=('f26203089a5cbf5e15d262e65b59983c'
         '55874b46bdf371a91f9d87f4ada166a5')

build () {
  cd ${srcdir}/Adamant_BG_OT
  mv "Adamant_ BG_BI.otf" "Adamant_BG_BI.otf"
}

package() {  
  cd ${srcdir}
  install -d -m 755 $pkgdir/usr/share/fonts/{OTF,TTF} || return 1  
  install -m644 Adamant_BG_TT/*.ttf $pkgdir/usr/share/fonts/TTF || return 1
  install -m644 Adamant_BG_OT/*.otf $pkgdir/usr/share/fonts/OTF || return 1
}
