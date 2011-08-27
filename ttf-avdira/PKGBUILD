# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-avdira
pkgver=1.01
pkgrel=1
pkgdesc="Greek font based on a 1493 typeface by Demetrios Damilas (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Avdira.zip LICENSE)
md5sums=('e41a538556ded2da66d90d95902bd16a'
         'bc1709dc3b1f6a7545ab366923e01a1c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp $srcdir/Avdira_?.otf $pkgdir/usr/share/fonts/OTF/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

