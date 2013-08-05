# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: havapunt <http://havapunt.deviantart.com>
pkgname=gnome-shell-theme-chrysalis-light
pkgver=1.0
pkgrel=1
pkgdesc="GNOME Shell Theme chrysalis light. Looks good in combination with the GTK-Theme Mediterranean"
arch=('any')
url="http://havapunt.deviantart.com/art/Chrysalis-light-3-8-387997464"
license=('unknown')
depends=('gnome-shell')
source=("http://fc01.deviantart.net/fs71/f/2013/205/0/e/chrysalis_light_3_8_by_havapunt-d6f04rc.zip")
md5sums=('13d4f40a9930cf4d154a6f196274e2f9')

package() {
  find "Chrysalis Light" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
