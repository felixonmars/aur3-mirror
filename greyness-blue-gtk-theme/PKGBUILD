# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=greyness-blue-gtk-theme
pkgver=2.1
pkgrel=1
pkgdesc="A grey GTK theme with a hint of blue"
url="http://craazyt.deviantart.com/art/Greyness-Blue-GTK-Theme-v1-281115376"
license=('GPL3')
arch=('any')
depends=('gtk-engine-unico' 'gtk-engine-murrine' 'gtk3')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/281115376/greyness_blue_gtk_theme_by_craazyt-d4nda0g.zip')
md5sums=('456e7feacd52ff8ca6add5103ba21c43')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/themes"
    mv "Greyness-Blue-GTK " "$pkgdir/usr/share/themes/Greyness-Blue"
    chmod 755 -R "$pkgdir/usr/share/themes/Greyness-Blue"
}

