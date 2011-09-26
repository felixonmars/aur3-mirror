# Maintainer: Alucryd <alucryd@gmail.com>
pkgname=gnome-shell-theme-deviantart
pkgver=1.0
pkgrel=1
pkgdesc="A gnome-shell theme by Half-Left bearing the colors of deviantART"
source=('http://www.deviantart.com/download/201411209/gnome_shell___deviantart_by_half_left-d3bwxvt.zip')
md5sums=('b5b3e7d1205ea61fb42bcd2181aae2ca')
arch=('any')
url="http://half-left.deviantart.com/art/GNOME-Shell-DeviantArt-201411209"
license=('GPL')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-theme-selector' 'gnome-tweak-tool')

package() {
    cd $srcdir/gs-deviantart/gnome-shell
    rm *~
    sed -i 's/devaintArt/deviantART/g' theme.json
    cd $srcdir
    mkdir -p "$pkgdir/usr/share/themes"
    mv gs-deviantart "${pkgdir}/usr/share/themes/deviantART"
}

