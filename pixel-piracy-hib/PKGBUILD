# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pixel-piracy-hib
pkgver=1.0.16.1
pkgrel=1
pkgdesc="side-scrolling 2D, real-time strategy/sandbox/simulation game - lead the life of a pirate captain"
url="http://piracysim.com/"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('gtk2' 'glu')
depends_x86_64=('lib32-gtk2' 'lib32-glu')
source=("hib://PP${pkgver}_Linux.zip"
        "$pkgname.sh")
sha256sums=('65a5b50461c1395632bd9adbdf9a6657a87cba85cc04bfd448482357fb05e46d'
            '95047b4bbefd88124079753d39759906f77e112f2d5e35eac5b222240383baa2')
PKGEXT=".pkg.tar"

package() {
  install -d "$pkgdir"/opt/pixel-piracy
  # data
  cp -rup Linux/linux_Data "$pkgdir"/opt/pixel-piracy
  # binary
  install -m755 Linux/linux.x86  "$pkgdir"/opt/pixel-piracy
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/pixel-piracy
}
