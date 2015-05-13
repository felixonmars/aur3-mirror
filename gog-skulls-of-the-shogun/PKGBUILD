# Maintainer : TimorLee

pkgname=gog-skulls-of-the-shogun
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Skulls of the Shogun is an arcade-style turn-based strategy game optimized for tactical and adaptive play. GOG linux game package required"
arch=("i686" "x86_64")
url="http://www.gog.com/game/skulls_of_the_shogun"
license=("custom")
groups=("games")
source=("local://gog_skulls_of_the_shogun_${pkgver}.tar.gz" 
"gog-skulls-of-the-shogun")
sha256sums=('3b414a309d97f7c0b260464ad8700f183775fbf7102e9b56591c86266de8e8c5'
            '7fad82a145b9d4623a7de10613f396c12b2a277f42ecf95cc83852773e2c68f9')
depends=(libtheora lib32-libvorbis)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/skulls-of-the-shogun
  cp -r "${srcdir}"/Skulls\ of\ the\ Shogun/* "${pkgdir}"/opt/gog/skulls-of-the-shogun
  install -Dm644 "${srcdir}"/Skulls\ of\ the\ Shogun/support/gog-skulls-of-the-shogun-primary.desktop "${pkgdir}"/usr/share/applications/gog-skulls-of-the-shogun.desktop
  install -Dm644 "${srcdir}"/Skulls\ of\ the\ Shogun/support/gog-skulls-of-the-shogun.png "${pkgdir}"/usr/share/pixmaps/gog-skulls-of-the-shogun.png
  install -Dm644 "${srcdir}"/Skulls\ of\ the\ Shogun/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-skulls-of-the-shogun" "${pkgdir}/usr/bin/gog-skulls-of-the-shogun"
} 
