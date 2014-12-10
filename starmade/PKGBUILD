# Maintainer: Sean Wright <seanwright3@gmail.com>

pkgname=starmade
pkgver=15.0
pkgrel=1
pkgdesc="Build a ship and shoot some space rocks."
arch=(any)
license=('custom')
url="http://star-made.org/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('StarMade-Starter.jar')
source=(starmade http://files.star-made.org/StarMade-Starter.jar starmade.install starmade.desktop starmade.png)
md5sums=('58c68d632d2e59dd558ef73e9e53eb65'
         'a2def67d6ceb5be6664daa1d4ed4da67'
         '5150e9c1f034fb2559c35377ff624888'
         '527303d67adde2645ddcbe6931e56b69'
         'c3c2dbd8d734b40b7f464feb24ed0fb4')

install='starmade.install'

package() {
    cd "$srcdir" || return 1

# directories
mkdir ${pkgdir}/usr/
mkdir ${pkgdir}/usr/share/
mkdir ${pkgdir}/usr/share/pixmaps/
mkdir ${pkgdir}/usr/bin/

# launch executable and menu entry
install -D -m755 "${srcdir}/starmade"              "${pkgdir}/usr/bin/"
install -D -m644 "${srcdir}/starmade.desktop"      "${pkgdir}/usr/share/applications/starmade.desktop"
install -D -m644 "${srcdir}/starmade.png"          "${pkgdir}/usr/share/pixmaps/starmade.png"

# game installation
install -D -m644 "${srcdir}/StarMade-Starter.jar"  "${pkgdir}/usr/share/starmade/StarMade-Starter.jar"
}
