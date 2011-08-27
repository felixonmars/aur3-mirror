pkgname=proggyopticyr-font
pkgver=1.0
pkgrel=2
depends=('xorg-font-utils')
makedepends=('xorg-font-utils')
pkgdesc="Bitmap font ProggyOpti with cyrillic symbols"
arch=('any')
license=('GPL')
url="http://www.proggyfonts.com/index.php?menu=download"
source=(ProggyOptiCyr-11.bdf)
install=$pkgname.install
md5sums=('d014fcd9a0c4c1dc96e397b6f9eb4238')

build()
{
  bdftopcf $srcdir/ProggyOptiCyr-11.bdf -o $srcdir/ProggyOptiCyr-11.pcf
  mkdir -p $pkgdir/usr/share/fonts/misc
  cp $srcdir/*.pcf $pkgdir/usr/share/fonts/misc
}
