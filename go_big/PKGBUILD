# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: M Rawash <mrawash@gmail.com>
pkgname=go_big
pkgver=v1.0.3
pkgrel=2
pkgdesc="A full-screen program launcher for GNOME"
arch=('any')
url="http://shaneharper.net/utils/$pkgname/"
license=('GPL')
depends=('gnome-menus2')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('837082aff6471cc403d45ae86a9dde13')

build() {
  cd $pkgname
  sed -i 's:^#!/usr/bin/env python$:&2:' $pkgname.py
  install -Dm755 $pkgname.py "$pkgdir"/usr/bin/$pkgname
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname/
}
