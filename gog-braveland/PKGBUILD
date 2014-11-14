# Maintainer : TimorLee

pkgname=gog-braveland
pkgver=1.0.0.5
pkgrel=1
pkgdesc="Braveland is a turn-based game inspired by old-school strategies with hexagonal battlefield. GOG linux game package required"
arch=("i686" "x86_64")
url="http://www.gog.com/game/braveland"
license=("custom")
groups=("games")
source=("braveland_${pkgver}.tar.gz" "gog-braveland")
md5sums=('7d0dfe2166f0144f473996aebd3c7cd4'
         '4d3ba26a7eb3746d8880a3d32b4b7977')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/braveland
  cp -r "${srcdir}"/Braveland/* "${pkgdir}"/opt/gog/braveland
  install -Dm644 "${srcdir}"/Braveland/support/gog-braveland-primary.desktop "${pkgdir}"/usr/share/applications/gog-braveland.desktop
  install -Dm644 "${srcdir}"/Braveland/support/gog-braveland.png "${pkgdir}"/usr/share/pixmaps/gog-braveland.png
  install -Dm644 "${srcdir}"/Braveland/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-braveland" "${pkgdir}/usr/bin/gog-braveland"
}
