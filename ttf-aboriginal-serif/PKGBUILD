# Maintainer: Noah Diewald <diewald.me: noah>
pkgname=ttf-aboriginal-serif
pkgver=9.606
pkgrel=2
pkgdesc="These fonts contain characters for Syllabics, Cherokee, and Latin Script (Roman orthography). Comes in Regular, Italic, Bold, and Bold Italic."
arch=('any')
url="http://www.languagegeek.com"
license=('GPL-3')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-aboriginal-serif.install
source=('http://www.languagegeek.com/font/AboriginalSerif.zip')
md5sums=('f220928cf6315ac9ec38e67783cea723')

package() {
  install -Dm644 $srcdir/AboriginalSerifBOLDITALIC.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifBOLDITALIC.ttf
  install -Dm644 $srcdir/AboriginalSerifBOLD.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifBOLDITALIC.ttf
  install -Dm644 $srcdir/AboriginalSerifITALIC.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifITALIC.ttf
  install -Dm644 $srcdir/AboriginalSerifREGULAR.ttf $pkgdir/usr/share/fonts/TTF/AboriginalSerifREGULAR.ttf
}
