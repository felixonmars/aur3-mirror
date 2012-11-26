# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Alexandre Défossez <alexandre.defossez at google mailing service>

pkgname="cortina"
pkgver=1.1.1
pkgrel=1
pkgdesc="A desktop wallpaper management application for GNOME"
arch=('i686' 'x86_64')
url="https://launchpad.net/cortina"
license=('GPL3')
depends=('gconf' 'qt')
source=(http://launchpad.net/cortina/trunk/$pkgver/+download/$pkgname\_$pkgver-0~5~precise1.tar.gz)
md5sums=('e8a06b48c186a8fe8fd6dec77c7f5a96')

build() {
  cd "$srcdir/recipe-{debupstream}-0~{revno}"
  qmake
  make
}

package() {
  cd "$srcdir/recipe-{debupstream}-0~{revno}"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/qt/translations/$pkgname"
  install -m 0664 po/*.qm "$pkgdir/usr/share/qt/translations/$pkgname"
  install -D -m 0644 "$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m 0644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
