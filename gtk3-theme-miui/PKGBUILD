# Maintainer: Check <i.like.webm@gmail.com>
pkgname=gtk3-theme-miui
pkgver=1.1.3
pkgrel=1
pkgdesc="MIUV4 GTK 2&3 Theme"
url="http://deviantn7k1.deviantart.com/#/d4tcgzf"
license=('GPL3')
arch=('any')
depends=('gtk-engine-unico' 'gnome-themes-standard')
optdepends=('metacity-theme-holo: For Metacity WM theme')
source=('http://www.deviantart.com/download/291155451/miuiv4_gtk3_by_deviantn7k1-d4tcgzf.7z')
md5sums=('f64d8da67e5bf2b9340c77d31d140b67')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/themes/MIUIv4TXT_1.1.3/
    cp -r $srcdir/MIUIv4_G4-1.1/gtk-3.0 $pkgdir/usr/share/themes/MIUIv4TXT_1.1.3/
}
