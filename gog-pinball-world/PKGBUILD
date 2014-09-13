# Maintainer: Jonathan Georges <jojos003@free.fr>
pkgname=gog-pinball-world
pkgver=1.0.0.1
pkgrel=1
pkgdesc="A 1995 pinball game"
arch=("i686" "x86_64")
url="http://www.gog.com/game/pinball_world"
license=('custom')
depends=(libpng12 unionfs-fuse)
source=("pinball_world_${pkgver}.tar.gz"
        "gog-pinball-world")
md5sums=('7340006d9bee167ef74d3ec0a863fd08'
         '1097d3cdca7e49bb0c25fb259c4c008a')

package() {
  mkdir -p ${pkgdir}/opt/gog/pinball-world
	cp -r ${srcdir}/Pinball\ World/* ${pkgdir}/opt/gog/pinball-world
  install -Dm644 ${srcdir}/Pinball\ World/support/gog-pinball-world-primary.desktop ${pkgdir}/usr/share/applications/gog-pinball-world.desktop
  install -Dm644 ${srcdir}/Pinball\ World/support/gog-pinball-world.png ${pkgdir}/usr/share/pixmaps/gog-pinball-world.png
  install -Dm644 ${srcdir}/Pinball\ World/docs/End\ User\ License\ Agreement.txt ${pkgdir}/usr/share/licences/${pkgname}/LICENSE
  install -Dm755 ${srcdir}/gog-pinball-world ${pkgdir}/usr/bin/gog-pinball-world
}

PKGEXT=.pkg.tar
