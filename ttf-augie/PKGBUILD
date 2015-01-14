# Maintainer: farnsworth517 <hikmet1517[at]gmail[dot]com>

pkgname=ttf-augie
pkgver=1.0
pkgrel=1
pkgdesc="Handwritten casual based on the fall 1982 classnotes of a solid B-minus college student."
install=$pkgname.install
arch=('any')
url="http://desktoppub.about.com/library/fonts/hs/uc_augie.htm"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
source=(http://desktoppub.about.com/library/fonts/hs/augie.zip)
md5sums=('83096e673c24235de7d13db428a1fca2')

package() {
  install -d $pkgdir/usr/share/fonts/TTF/ 
  install -m644 augie.ttf $pkgdir/usr/share/fonts/TTF/
}
