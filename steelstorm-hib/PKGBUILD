# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on steelstorm2-hib package by Jose Riha <jose1711@gmail.com>

pkgname=steelstorm-hib
_pkgname=steelstorm
pkgver=2.00.02818
pkgrel=1
url="http://www.steel-storm.com/"
pkgdesc="a classic top down shooter, rife with explosions and things to explode, with a distinct visual style (version included in Humble Indie Bundle No 3)"
arch=('any')
license=('commercial')
install=${_pkgname}.install
depends=('darkplaces')
replaces=('steelstorm')
source=(steelstorm-br-${pkgver}-release.tar.gz
        steelstorm.desktop
        steelstorm.sh
        steelstorm-dedicated.desktop
        steelstorm-dedicated.sh)
sha256sums=('962345665f41795111886f1f23755bd356f7bab51fe03acb5a25d4752f384d1b'
            'eabd1a4047be61a356d56642ac2d283478565ab0df3ac40158f9e66b802502a3'
            '9c4ecd2e405f6de344fa3d0ad0c78421b2a3c81470d32373c90d7575ea7384c9'
            '89eeab145bdf067546f4fdc56a0ffd56791555840f5df5b38e1dfeed8d04a0cb'
            'd82e77742adff672e2f58e36dead7647e87ac1b0cd72065c7dd25bbfe62b8df4')
conflicts=('steelstorm2' 'steelstorm' 'steelstorm-beta')

# Make an uncompressed package for speed's sake
PKGEXT=".pkg.tar"

build() {
  true
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/share/steelstorm/gamedata"
  install -Dm 644 gamedata/* "${pkgdir}/usr/share/steelstorm/gamedata"

  install -Dm 644 icons/ss_ep2_icon_256.png "${pkgdir}/usr/share/icons/steelstorm.png"
  install -Dm 644 "${srcdir}/steelstorm.desktop" "${pkgdir}/usr/share/applications/steelstorm.desktop"
  install -Dm 644 "${srcdir}/steelstorm-dedicated.desktop" "${pkgdir}/usr/share/applications/steelstorm-dedicated.desktop"
  install -Dm 755 "${srcdir}/steelstorm.sh" "${pkgdir}/usr/bin/steelstorm"
  install -Dm 755 "${srcdir}/steelstorm-dedicated.sh" "${pkgdir}/usr/bin/steelstorm-dedicated"

  install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/steelstorm/license.txt"
}
