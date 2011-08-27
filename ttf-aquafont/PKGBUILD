# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=ttf-aquafont
pkgver=2.8
pkgrel=7
pkgdesc="Handwritten fixed-width TrueType font"
# url seems to be down, so may not work
url="http://aquablue.milkcafe.to/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-aquafont.install
#source=('http://aquablue.milkcafe.to/tears/font/aqua2_8.lzh' 'license.txt')
# get source from own backup, homepage seems to be down (seriously can't really read it)
source=('http://dev.archlinux.org/~ronald/source/aquafont-2.8.tar.bz2' \
	'license.txt')
arch=('any')
md5sums=('dec44152c1858f4b0d127066f2c6d20d'
         '20e9219ebd52a9df83aad5d5820a64ab')

 build() {
  install -Dm644 $srcdir/aquafont-$pkgver/aquafont.ttf \
  	$pkgdir/usr/share/fonts/TTF/aquafont.ttf
  install -Dm644 $startdir/src/license.txt $startdir/pkg/usr/share/licenses/ttf-aquafont/license.txt 
 }

