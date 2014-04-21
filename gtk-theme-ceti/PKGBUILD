# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: horst3180 @ deviantart
pkgname=gtk-theme-ceti
pkgver=1.1
pkgrel=1
pkgdesc="A darker theme with a mix of blue and light grey colors. Supports GNOME Shell, GTK3 and GTK2."
arch=('any')
url="http://horst3180.deviantart.com/art/Ceti-445892596"
license=('GPLv3')
depends=('gtk-engine-murrine')
source=("http://fc09.deviantart.net/fs71/f/2014/106/0/1/ceti_by_horst3180-d7dh0xg.zip")
md5sums=('a405813af9658d86d4400e9c996821bc')

package() {
    cd "Ceti-theme/Gnome_3-12"
    find "Ceti" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
