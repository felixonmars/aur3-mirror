# Maintainer: Zack Corr <zack@z0w0.me>

pkgname=phaedra
pkgver=1.0
pkgrel=3
pkgdesc="A reverse dungeon crawler in which you play a villain forced to defend his dungeon from an onslaught of heroes (LD25 jam entry)"
depends=("love")
arch=("any")
source=("http://centhra.com/ld/25/phaedra-src.tar.gz"
        "run.sh"
        "icon.png"
        "phaedra.desktop")
md5sums=("7afc996e9184a7d37967ab6f2000b318"
         "3db152437f501dc6827e099ab01a9772"
         "1ec0df74fd6afa942a1d4ca869f804cf"
         "06abb0fe2cd6df20da28ebd77d467c19")
url="http://github.com/centhra/ld25"
license="MIT"

build() {
  sh util/dist.sh
}

package() {
  install -d ${pkgdir}/opt/phaedra
  install -d ${pkgdir}/usr/share/applications
  install dist/phaedra.love ${pkgdir}/opt/phaedra/phaedra.love
  install icon.png ${pkgdir}/opt/phaedra/icon.png
  install phaedra.desktop ${pkgdir}/usr/share/applications
  install -D -m755 run.sh ${pkgdir}/usr/bin/phaedra
}
