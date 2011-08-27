# Maintainer: Julius2 <lt_a_p@yahoo.co.uk>
# Original font design by Curtis Clark <jcclark@mockfont.com>

pkgname=ttf-piechartsformaps
pkgver=1.1
pkgrel=1
url="http://mockfont.com/old"
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A font that displays pie charts, useful for displaying approximate fractional values in increments of 5%"
arch=('any')
license=('custom')
source=(http://mockfont.com/old/files/pie4mp11.zip)
install=$pkgname.install
md5sums=('a0aa042d297180e851021b2dc2f501e4')

build() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  mkdir -p "$pkgdir/usr/share/$pkgname"

install -Dm 644 PIE4MAP.TTF $pkgdir/usr/share/fonts/TTF/pie4map.ttf
install -Dm 644 PIE4MAP.TXT $pkgdir/usr/share/doc/ttf-piechartsformaps/pie4map.txt
install -Dm 644 PIE4MAP.WRI $pkgdir/usr/share/doc/ttf-piechartsformaps/pie4map.wri
install -Dm 644 LICENSE.TXT $pkgdir/usr/share/licenses/ttf-piechartsformaps/license.txt
#  mkdir -p $pkgdir/usr/share/fonts/TTF
#  cp $srcdir/$pkgname/*.ttf $pkgdir/usr/share/fonts/TTF
}

