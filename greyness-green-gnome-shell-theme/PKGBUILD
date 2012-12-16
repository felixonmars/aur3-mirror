# Maintainer: lincore <dvl dot lincore at gmail dot com>
pkgname=greyness-green-gnome-shell-theme
pkgver=1.0
pkgrel=1
pkgdesc="Greyness-Green Gnome-shell theme by CraazyT"
url="http://craazyt.deviantart.com/art/Greyness-Green-Gnome-Shell-290030452"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/290030452/greyness_green_gnome_shell_by_craazyt-d4socxg.zip')
md5sums=('78de650e236145bc596def519ef63f5a')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/themes"
    mv "Greyness-Green" "$pkgdir/usr/share/themes/Greyness-Green"
    chmod 755 -R "$pkgdir/usr/share/themes/Greyness-Green"
}
