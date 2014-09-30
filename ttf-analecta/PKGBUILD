# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=ttf-analecta
pkgver=4.01
pkgrel=2
pkgdesc="Font for ecclesiastic scripts (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://users.teilar.gr/~g1951d/Analecta.zip LICENSE)
install=$pkgname.install

package()
{
  for file in "${srcdir}"/*ttf; do
    install -m 644 -D "${file}" "${pkgdir}/usr/share/fonts/TTF"/$(basename $file)
  done

  install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE   
}

md5sums=('eaa49af7950521fb7421c6f721f214aa'
         'bc1709dc3b1f6a7545ab366923e01a1c')
