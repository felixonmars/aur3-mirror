# Contributor: Bernardo Barros <bbarros@xsounds.org>

pkgname=soundfont-grand-piano-ydp
pkgver=20080910
pkgrel=1
pkgdesc="FluidR3_GM soundfont"
arch=('any')
url="http://www.musescore.org/en/handbook/soundfont"
license=('custom:Public Domain')
source=("http://freepats.zenvoid.org/sf2/acoustic_grand_piano_ydp_20080910.sf2")
md5sums=('d568b2bdee099db5d0647852428fd759')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/soundfonts/
  install -Dm644 *.sf2 $pkgdir/usr/share/soundfonts/
}
