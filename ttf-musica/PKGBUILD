#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>
#Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=ttf-musica
pkgver=3.11
pkgrel=1
pkgdesc="Font for unicode music notations (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(Musica-${pkgver}.ttf::http://users.teilar.gr/~g1951d/Musica.ttf LICENSE)
install=$pkgname.install

package()
{
    install -m 644 -D "${srcdir}/Musica-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/Musica.ttf"
    install -m 644 -D "${srcdir}/LICENSE"              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"   
}

md5sums=('812a571e41f26dd0588b6895183fcd8b'
         'bc1709dc3b1f6a7545ab366923e01a1c')
