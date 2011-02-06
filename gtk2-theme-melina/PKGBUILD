# Maintainer:  Wang Feng <wanng[dot]fenng[at]gmail[dot]com>
# Author: Duda Weyll <duda[at]weyll[dot]com>

pkgname=gtk2-theme-melina
pkgver=1.0
pkgrel=2
pkgdesc="Melina gtk2 theme, Based on Human Murrine and Slim Metacity."
arch=('any')
url="http://www.weyll.com"
license=('GPL')
source=("http://gnome-look.org/CONTENT/content-files/105536-Melina.tar.gz")

build() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -rf "$srcdir/Melina" "$pkgdir/usr/share/themes"
}

md5sums=('42b418708a92b81eb5b32c44b21ac083')

