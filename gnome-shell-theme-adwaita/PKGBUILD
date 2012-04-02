# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-theme-adwaita
pkgver=3.2
pkgrel=2
pkgdesc="A GNOME Shell theme based on the Adwaita GTK theme"
url="http://half-left.deviantart.com/art/GNOME-Shell-Adwaita-277031308"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/277031308/gnome_shell___adwaita_by_half_left-d4kxqq4.zip')
md5sums=('f4b000d16c4dadc89bea7eaff655aca1')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/themes"
    mv Adwaita "$pkgdir/usr/share/themes/Adwaita-Shell"
}
