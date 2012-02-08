# Maintainer: JokerBoy <jokerboy at punctweb dot ro>

pkgname=thingmenu
pkgver=0.8
pkgrel=1
pkgdesc="A simple X11 menu"
arch=('i686' 'x86_64')
url="http://git.r-36.net/thingmenu/"
license=('MIT')
depends=('libx11')
source=("http://git.r-36.net/thingmenu/snapshot/$pkgname-$pkgver.tar.bz2"
        'config.h')
sha256sums=('3c84ed1d6bbdc86f58045939f703b01e0c597a9dd813fcbd6cd4af7a11abc410'
            '0156fb51424d8ef33b5b4689692bb9e67d8366113a106a2d1685db0d504d7f1d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp "$srcdir/config.h" config.h

  sed -i 's/CPPFLAGS =/CPPFLAGS +=/g' config.mk
  sed -i 's/^CFLAGS = -g/CFLAGS += /g' config.mk
  sed -i 's/^LDFLAGS = -g/#LDFLAGS += -g/g' config.mk
  sed -i 's/^#LDFLAGS = -s/LDFLAGS += -s/g' config.mk

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
