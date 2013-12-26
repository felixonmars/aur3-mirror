# Maintainer: Carlos Pita <carlosjosepita@gmail.com>
pkgname=h2status-git
pkgver=r6.954b75c
pkgrel=1
pkgdesc="Simple i3status bash wrapper with json, mouse events and asynchronous update support"
arch=('any')
url="https://wiki.archlinux.org/index.php/H2status"
license=('GPL')
depends=('i3status' 'util-linux')
makedepends=('git')
provides=('h2status')
conflicts=('h2status')
source=('h2status'::'git+https://gist.github.com/8115385.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/h2status"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -m 755 -D "$srcdir/h2status/h2status" "$pkgdir/usr/bin/hgstatus"
  install -m 644 -D "$srcdir/h2status/h2statusrc" "$pkgdir/usr/share/hgstatus/hgstatusrc"
}
