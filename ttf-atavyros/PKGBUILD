# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-atavyros
pkgver=1.01
pkgrel=1
pkgdesc="Greek font based on a 1560 typeface by Robert Granjon (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Atavyros.zip LICENSE)
md5sums=('d3d766ddf201957289ca14bbe11ceec2'
         'bc1709dc3b1f6a7545ab366923e01a1c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp $srcdir/Atavyros.otf $pkgdir/usr/share/fonts/OTF/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

