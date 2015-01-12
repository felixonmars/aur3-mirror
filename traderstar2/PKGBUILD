# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=traderstar2
pkgver=2013.12.30
pkgrel=1
pkgdesc="Stock market program for technical analysis."
arch=('any')
url="http://www.neonway.com/apps/traderstar2/"
license=('GPL3')
source=(http://www.neonway.com/TraderStar2.tar.gz
        http://www.neonway.com/apps/${pkgname}icon.png
        $pkgname.desktop)
md5sums=('027ad34b6417e103dea4ec0e0f3d6a7e'
         '40af80128bb5097b77841e5261831615'
         'ba4be9a317dd074086f8ba01863e3aff')

package() {
  cd $srcdir

  # Desktop icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 ${pkgname}icon.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # Program data
  cp -r TraderStar2 $pkgdir/usr/share
}
