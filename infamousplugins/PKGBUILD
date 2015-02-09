# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=infamousplugins
pkgver=0.0.26
pkgrel=3
pkgdesc="A collection of open-source LV2 plugins"
arch=('i686' 'x86_64')
url="http://infamousplugins.sourceforge.net"
license=('GPL2')
groups=('lv2-plugins')
depends=('glibc' 'fftw')
makedepends=('qt4' 'lv2')
provides=('infamousplugins')
conflicts=('infamousplugins')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-v$pkgver.tar.gz")
md5sums=('cbe89c39d590a6defb49a015287776f1')
_plugins="CellularAutomatonSynth EnvelopeFollower Hip2B Stuck PowerCut PowerUp EWham"


build() {
    cd "$srcdir"
    for plugin in $_plugins
    do
      qmake-qt4 -o src/$plugin/Makefile src/$plugin/$plugin.pro
      make -C src/$plugin
    done
    gcc src/rule.c -o src/infamous-rule
    make -C src/cheap_distortion
}

package() {
    cd "$srcdir"
    for plugin in $_plugins
    do
      make INSTALL_ROOT="$pkgdir" -C src/$plugin install
    done
    install -Dm755 src/infamous-rule "$pkgdir/usr/bin/infamous-rule"
    make INSTALL_DIR="$pkgdir/usr/lib/lv2" -C src/cheap_distortion install
    install -Dm644 COPYING "$pkgdir/usr/share/doc/$pkgname/COPYING"
    install -Dm644 README  "$pkgdir/usr/share/doc/$pkgname/README"
}

