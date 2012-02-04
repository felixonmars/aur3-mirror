# Contributor: pressh <pressh at gmail dot com>

pkgname=ttf-zekton
pkgver=061222
pkgrel=1
pkgdesc="Cool truetype font"
url="http://www.e17-stuff.org/content/show.php/Zekton?content=50553"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.e17-stuff.org/CONTENT/content-files/50553-zekton.tar.gz')
install=ttf-zekton.install
arch=('i686' 'x86_64')
md5sums=('12fc487818c335f9a80999d0768fa8d7')
         
 build() {
  install -Dm644 $startdir/src/zekton__.ttf ${startdir}/pkg/usr/share/fonts/TTF/zekton.ttf
   install -Dm644 $startdir/src/zektonbi.ttf ${startdir}/pkg/usr/share/fonts/TTF/zektonbi.ttf
  install -Dm644 $startdir/src/zektonbo.ttf ${startdir}/pkg/usr/share/fonts/TTF/zektonbo.ttf
  install -Dm644 $startdir/src/zektonit.ttf ${startdir}/pkg/usr/share/fonts/TTF/zektonit.ttf

  # install license
  install -Dm644 $startdir/src/READ_ME.TXT $startdir/pkg/usr/share/licenses/ttf-zekton/LICENSE
 }
