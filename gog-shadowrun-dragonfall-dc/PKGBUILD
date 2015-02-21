# Maintainer : TimorLee <vexron[at]gmx.de

pkgname=gog-shadowrun-dragonfall-dc
pkgver=1.5.0.8
pkgrel=1
pkgdesc="The critically acclaimed shadowrun campaign! Classic RPG based on Shadowrun and released on GOG as a standalone"
arch=("i686" "x86_64")
url="http://www.gog.com/game/shadowrun_dragonfall_directors_cut"
license=("custom")
groups=("games")
source=("gog_shadowrun_dragonfall_dc_${pkgver}.tar.gz" "gog-shadowrun-dragonfall-dc")
md5sums=('08d7ff968a308a7ae4c27a076a60f52f'
         '52a60bc097ca6677eb9e8ff50e34e8a2')
depends=(lib32-libstdc++5 lib32-libx11 lib32-libxcursor lib32-libxcb lib32-libdrm desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/shadowrun-dragonfall-dc
  cp -r "${srcdir}"/Shadowrun\ Dragonfall\ DC/* "${pkgdir}"/opt/gog/shadowrun-dragonfall-dc
  install -Dm644 "${srcdir}"/Shadowrun\ Dragonfall\ DC/support/gog-shadowrun-dragonfall-dc-primary.desktop "${pkgdir}"/usr/share/applications/gog-shadowrun-dragonfall-dc-primary.desktop
  install -Dm644 "${srcdir}"/Shadowrun\ Dragonfall\ DC/support/gog-shadowrun-dragonfall-dc.png "${pkgdir}"/usr/share/pixmaps/gog-shadowrun-dragonfall-dc.png
  install -Dm644 "${srcdir}"/Shadowrun\ Dragonfall\ DC/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-shadowrun-dragonfall-dc" "${pkgdir}/usr/bin/gog-shadowrun-dragonfall-dc"
  chmod -R 755 "${pkgdir}/opt/gog/shadowrun-dragonfall-dc"
}
