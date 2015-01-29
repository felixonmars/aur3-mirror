# Maintainer : TimorLee

pkgname=gog-door-kickers
pkgver=1.3.0.5
pkgrel=1
pkgdesc="Door Kickers is an innovative real-time strategy game that puts you in charge of a SWAT team and lets you command them during a tactical intervention. GOG linux game package required"
arch=("i686" "x86_64")
url="http://www.gog.com/game/door_kickers"
license=("custom")
groups=("games")
source=("gog_door_kickers_${pkgver}.tar.gz" "gog-door-kickers")
md5sums=('dc5cdb8b8aaf4862b2ac6a9b7b08144b'
         'cfa7a229083e347d425765634d92b7f1')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/door-kickers
  cp -r "${srcdir}"/Door\ Kickers/* "${pkgdir}"/opt/gog/door-kickers
  install -Dm644 "${srcdir}"/Door\ Kickers/support/gog-door-kickers-primary.desktop "${pkgdir}"/usr/share/applications/gog-door-kickers.desktop
  install -Dm644 "${srcdir}"/Door\ Kickers/support/gog-door-kickers.png "${pkgdir}"/usr/share/pixmaps/gog-door-kickers.png
  install -Dm644 "${srcdir}"/Door\ Kickers/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-door-kickers" "${pkgdir}/usr/bin/gog-door-kickers"
}
