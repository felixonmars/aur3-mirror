# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fotaq-fr
pkgver=1.0
pkgrel=1
pkgdesc='Graphical point-and-click adventure game (aka "Flight of the Amazon Queen") - french language'
arch=('any')
url="http://en.wikipedia.org/wiki/Flight_of_the_amazon_queen"
license=('custom')
depends=('scummvm')
source=("http://downloads.sourceforge.net/scummvm/FOTAQ_Fr_Talkie_$pkgver.zip"
        "$pkgname.sh")
sha256sums=('9e670686c538191a1acf3bd09ef83a11262d23247b9258ec1495b39931790543'
            'c54c116f1002fa6dbd4414816113de69f5089286d842fcf3d793362f2657ae9e')

package() {
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  # data
  install -Dm644 queen.1c "$pkgdir"/usr/share/$pkgname/queen.1c
  #license
  install -Dm644 readme.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
