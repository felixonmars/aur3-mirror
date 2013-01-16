# Maintainer: TDY <tdy@archlinux.info>
# Contributor: nut543 <kfs1@online.no>

pkgname=thinglaunch
pkgver=1.8
pkgrel=1
pkgdesc="A minimalist application launcher for X"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/thinglaunch/"
license=('MIT')
depends=('libx11')
source=(http://matt.ucc.asn.au/src/thinglaunch.c)
md5sums=('4d0df175cf0d13ffb162c6b9236c056a')

build() {
  cd "$srcdir"
  cc thinglaunch.c -o thinglaunch -lX11 -L/usr/lib -lpthread
}

package() {
  cd "$srcdir"
  install -Dm755 thinglaunch "$pkgdir/usr/bin/thinglaunch"
  sed '301,320 !d' <thinglaunch.c >license
  install -Dm644 license "$pkgdir/usr/share/licenses/thinglaunch/license"
}

# vim:set ts=2 sw=2 et:
