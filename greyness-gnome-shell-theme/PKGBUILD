# Maintainer: lincore <dvl dot lincore at gmail dot com>
pkgname=greyness-gnome-shell-theme
pkgver=1.0
pkgrel=1
pkgdesc="A grey Gnome-shell theme by CraazyT"
url="http://craazyt.deviantart.com/art/Greyness-Gnome-Shell-Theme-281035576"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/281035576/greyness_gnome_shell_theme_by_craazyt-d4nbkfs.zip')
md5sums=('fdc915a49ac1d0e1e9f6f8e30cee42a5')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/themes"
    mv "Greyness" "$pkgdir/usr/share/themes/Greyness"
    chmod 755 -R "$pkgdir/usr/share/themes/Greyness"
}

