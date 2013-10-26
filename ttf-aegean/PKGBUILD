# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-aegean
pkgver=7.14
pkgrel=1
pkgdesc="Font for aegean scripts (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(Aegean-${pkgver}.ttf::http://users.teilar.gr/~g1951d/Aegean.ttf LICENSE)
install=$pkgname.install

package()
{
  install -m 644 -D $srcdir/Aegean-${pkgver}.ttf $pkgdir/usr/share/fonts/TTF/Aegean.ttf
  install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


md5sums=('e45fa9b34bf84cf3d22b3601851d915d'
         'bc1709dc3b1f6a7545ab366923e01a1c')
