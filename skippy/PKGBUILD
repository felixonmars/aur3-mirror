# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: rxvt <artwithin@gmail.com>

pkgname=skippy
pkgver=0.5.0
pkgrel=4
pkgdesc="A full-screen task switcher for X11, similar to Apple Expose"
url="http://thegraveyard.org/skippy.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('imlib2' 'libxft' 'libxinerama' 'libxmu')
install=skippy.install
source=(http://cdn.thegraveyard.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2
        README)
sha256sums=('8f0f15f34a9fcfacb36cc8dc156d0d10c62020bbdd45edc348af67d861b74a99'
            'f37366e5b9579d017c93c500e6338417c651990bfe77461d2d5238d23f334682')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '261s,CARD32,void*,' wm.c
  export CFLAGS+=" -DDEBUG -DXINERAMA"
  export LDFLAGS+=" -lXext -lXinerama"
  make PREFIX=/usr X11PREFIX=/usr/lib
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 skippyrc-default "$pkgdir/usr/share/$pkgname/skippyrc"
  install -Dm644 ../README "$pkgdir/usr/share/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
