# Maintainer: Thanh Ha <thanh.ha@alumni.carleton.ca>
#
# Repository: https://github.com/zxiiro/arch-orion

pkgname=orion
pkgver=2.0
pkgrel=2
epoch=
pkgdesc="Open Source Platform for Cloud Based Development"
arch=('x86_64')
url="http://www.eclipse.org/orion/"
license=('EPL')
groups=()
depends=(java-runtime)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=changelog
source=(http://www.eclipse.org/downloads/download.php?file=/orion/drops/R-2.0-201302221257/eclipse-orion-2.0-linux.gtk.x86_64.zip\&r=1
        orion.conf
        orion.sh)
noextract=()
sha256sums=('df7b44c9555f58adc2363295ac32c4cef0585ef2987f74cd3182a12a9d73c8a9'
            '1eeb53f33a3d5f8a4de2e2bdd2ca800729fec15b17248577d97558fcb60ab1bf'
            'd3225aa19b2a0ac577a277d7fd50068aed6ede2b10523a3103e52cfd279e7481')

package() {
  #install orion
  mkdir -p $pkgdir/usr/share
  mv eclipse $pkgdir/usr/share/$pkgname

  # setup orion home
  install -m 755 -d $pkgdir/var/lib/$pkgname
  install -D -m 644 $srcdir/orion.conf $pkgdir/var/lib/$pkgname/orion.conf
}

# vim:set ts=2 sw=2 et:

