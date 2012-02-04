# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=gtk-theme-overglossed-hybrid
pkgver=0.2
pkgrel=1
pkgdesc="Overglossed GTK 2.0 dark theme - some blue, some dark"
arch=('any')
license=('GPL')
depends=('gtk2')
url=('http://calimeroteknik.free.fr/c2de')
source=(http://calimeroteknik.free.fr/c2de/OverglossedHybrid.tar.bz2)
md5sums=('0f10090c3220a84e7c46f3ae7fe0e44a')

build() {
  mkdir -p $pkgdir/usr/share/themes
  cp -r $srcdir/OverglossedHybrid $pkgdir/usr/share/themes/
  chmod -R 755 $pkgdir/usr
}
