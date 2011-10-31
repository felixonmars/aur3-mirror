# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-theme-tron-legacy
pkgver=3.2
pkgrel=1
pkgdesc="A GNOME Shell theme inspired by the film Tron Legacy"
url="http://half-left.deviantart.com/art/GNOME-Shell-Tron-Legacy-208220836"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/208220836/gnome_shell___tron_legacy_by_half_left-d3fyw84.zip')
md5sums=('9584938d2a23adbdfc30b194c137cd72')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/themes
    unzip -q Tron-Legacy-3.2.zip -d $pkgdir/usr/share/themes
}
