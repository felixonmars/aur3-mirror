# Contributor: Noah Diewald <noah@diewald.me>

pkgname=ttf-aboriginal-serif
pkgver=9.606
pkgrel=1
pkgdesc="These fonts contain characters for Syllabics, Cherokee, and Latin Script (Roman orthography). Comes in Regular, Italic, Bold, and Bold Italic."
url="http://www.languagegeek.com"
license=('GPL-3')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-aboriginal-serif.install
source=('http://www.languagegeek.com/font/AboriginalSerif.zip')
arch=('any')
md5sums=('f220928cf6315ac9ec38e67783cea723')

 build() {
  install -Dm644 $srcdir/AboriginalSerifBOLDITALIC.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifBOLDITALIC.ttf
  install -Dm644 $srcdir/AboriginalSerifBOLD.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifBOLDITALIC.ttf
  install -Dm644 $srcdir/AboriginalSerifITALIC.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifITALIC.ttf
  install -Dm644 $srcdir/AboriginalSerifREGULAR.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifREGULAR.ttf
 }


