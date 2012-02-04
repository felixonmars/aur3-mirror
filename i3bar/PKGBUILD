# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=i3bar
pkgver=0.7_rc
_pkgver=0.7-rc
pkgrel=1
pkgdesc="An xcb-based status- and ws-bar for i3"
arch=('i686' 'x86_64')
url="http://git.merovius.de/i3bar/"
license=('BSD')
groups=('i3')
depends=('libx11' 'yajl' 'libev')
makedepends=('pkgconfig' 'asciidoc' 'i3-wm')
source=("http://git.merovius.de/i3bar/snapshot/$pkgname-$_pkgver.tar.bz2")
md5sums=('93fbf9a2fedc17090c8dff70d3ebb476')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/i3bar/LICENSE"
}

# vim:set ts=2 sw=2 et:
