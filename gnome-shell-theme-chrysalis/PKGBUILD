# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: havapunt <http://havapunt.deviantart.com>
pkgname=gnome-shell-theme-chrysalis
pkgver=1.0
pkgrel=1
pkgdesc="GNOME Shell Theme chrysalis. Looks good in combination with the GTK-Theme Mediterranean"
arch=('any')
url="http://havapunt.deviantart.com/art/Chrysalis-3-8-387995623"
license=('unknown')
depends=('gnome-shell')
source=("http://fc06.deviantart.net/fs71/f/2013/205/1/5/chrysalis_3_8_by_havapunt-d6f03c7.zip")
md5sums=("5e3d251300752199ec39c439a7b13a08")

package() {
  find Chrysalis -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
