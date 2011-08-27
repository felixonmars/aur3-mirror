# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-alfios
pkgver=1.01
pkgrel=1
pkgdesc="Greek font based on the 1805 Didot typeface (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Alfios.zip LICENSE)
md5sums=('49eacfdddae831e41865a0bd156a6be5'
         'bc1709dc3b1f6a7545ab366923e01a1c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp $srcdir/Alfios_?.otf $pkgdir/usr/share/fonts/OTF/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

