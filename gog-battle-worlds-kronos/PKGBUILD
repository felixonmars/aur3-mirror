# Maintainer : TimorLee

pkgname=gog-battle-worlds-kronos
pkgver=1.1.0.5
pkgrel=2
pkgdesc="Battle World: Kronos is a classic turn-based strategy game in the tradition of Battle Isle, Advance Wars and Panzer General. GOG linux game package required"
arch=("i686" "x86_64")
url="http://www.gog.com/game/battle_worlds_kronos"
license=("custom")
groups=("games")
source=("local://gog_battle_worlds_kronos_${pkgver}.tar.gz" 
"gog-battle-worlds-kronos")
sha256sums=('f7e85c911da3f982a627480d8492ff417acf629a9a2114d150998129016c52fd'
            '8ba51cd4b6d8fe51bf567adf0f8d77093f7a270b319264bb3c2e036a30930344')
depends=(libgl lib32-glu)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/battle-worlds-kronos
  cp -r "${srcdir}"/Battle\ Worlds\ -\ Kronos/* "${pkgdir}"/opt/gog/battle-worlds-kronos
  install -Dm644 "${srcdir}"/Battle\ Worlds\ -\ Kronos/support/gog-battle-worlds-kronos-primary.desktop "${pkgdir}"/usr/share/applications/gog-battle-worlds-kronos.desktop
  install -Dm644 "${srcdir}"/Battle\ Worlds\ -\ Kronos/support/gog-battle-worlds-kronos.png "${pkgdir}"/usr/share/pixmaps/gog-battle-worlds-kronos.png
  install -Dm644 "${srcdir}"/Battle\ Worlds\ -\ Kronos/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-battle-worlds-kronos" "${pkgdir}/usr/bin/gog-battle-worlds-kronos"
  chmod -R 755 "${pkgdir}/opt/gog/battle-worlds-kronos/game/BattleWorldsKronos_Data/"
}
