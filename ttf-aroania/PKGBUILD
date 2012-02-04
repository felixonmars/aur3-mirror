# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-aroania
pkgver=1.01
pkgrel=1
pkgdesc="Greek font based on the 1927 New Hellenic typeface (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Aroania.zip LICENSE)
md5sums=('b792e56c510e9afd8810a5c69df74201'
         'bc1709dc3b1f6a7545ab366923e01a1c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp $srcdir/Aroania_?.otf $pkgdir/usr/share/fonts/OTF/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

