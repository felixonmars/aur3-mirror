# Maintainer : TimorLee <vexron[at]gmx.de>

pkgname=gog-sir-you-are-being-hunted
pkgver=1.1.0.3
pkgrel=2
pkgdesc="You are being hunted. Better keep moving and find a way to escape! 
The GOG tarball needs to be in the package directory to install this game."
arch=("i686" "x86_64")
url="http://www.gog.com/game/sir_you_are_being_hunted"
license=("custom")
groups=("games")
source=("gog_sir_you_are_being_hunted_${pkgver}.tar.gz" 
"gog-sir-you-are-being-hunted")
sha256sums=('282019382e8db02f57a0ee6299fd97a19fb87e63b40491be1d4e3879bd6b604f' 
'9bf1e1c947776e1768b312dc7c35f9e6c00734026e54d0280fa432494eea84fe')
depends=(lib32-libstdc++5 lib32-libx11 lib32-libxcursor lib32-libxcb lib32-libdrm desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/sir-you-are-being-hunted
  cp -r "${srcdir}"/Sir\ You\ Are\ Being\ Hunted/* "${pkgdir}"/opt/gog/sir-you-are-being-hunted
  mkdir -p "${srcdir}"/opt/gog/sir-you-are-being-hunted/game/sir_
  install -Dm644 "${srcdir}"/Sir\ You\ Are\ Being\ Hunted/support/gog-sir-you-are-being-hunted-primary.desktop "${pkgdir}"/usr/share/applications/gog-sir-you-are-being-hunted.desktop
  install -Dm644 "${srcdir}"/Sir\ You\ Are\ Being\ Hunted/support/gog-sir-you-are-being-hunted.png "${pkgdir}"/usr/share/pixmaps/gog-sir-you-are-being-hunted.png
  install -Dm644 "${srcdir}"/Sir\ You\ Are\ Being\ Hunted/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-sir-you-are-being-hunted" "${pkgdir}/usr/bin/gog-sir-you-are-being-hunted"
  chmod 777 "${srcdir}"/opt/gog/sir-you-are-being-hunted/game/sir_/
}

