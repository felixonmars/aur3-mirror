# Maintainer: Carlos Pita <carlosjosepita@gmail.com>
pkgname=h2status
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple i3status bash wrapper with json, mouse events and asynchronous update support"
arch=('any')
url="https://wiki.archlinux.org/index.php/H2status"
license=('GPL')
depends=('i3status' 'util-linux')
provides=('h2status')
conflicts=('h2status')
source=('h2status' 'h2statusrc')
md5sums=('SKIP' 'SKIP')

package() {
  install -m 755 -D "$srcdir/h2status" "$pkgdir/usr/bin/hgstatus"
  install -m 644 -D "$srcdir/h2statusrc" "$pkgdir/usr/share/hgstatus/hgstatusrc"
}
