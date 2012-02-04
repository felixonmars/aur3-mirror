# Maintainer: Alucryd <alucryd@gmail.com>
pkgname=dawaita-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc="A GTK3-GTK2 theme for the deviantART shell theme by Half-Left"
source=('http://www.deviantart.com/download/213138178/dawaita_gtk3_gtk2_theme_by_alucryd-d3iwagy.zip')
md5sums=('26f6efb3d1129a85ee7c3e4a3c16b2d9')
arch=('any')
url="http://alucryd.deviantart.com/art/dAwaita-GTK3-GTK2-Theme-213138178"
license=('GPL')
depends=('gtk3' 'gtk-engines')
optdepends=('gnome-tweak-tool')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/themes"
    mv dAwaita "$pkgdir/usr/share/themes"
}

