# Maintainer:  TDY <tdy@gmx.com>
# Contributor: nut543 <kfs1@online.no>

pkgname=vor
pkgver=0.5.4
pkgrel=2
pkgdesc="A classic spaceship versus asteroid field arcade game (Variations on Rockdodger)"
arch=('i686' 'x86_64')
url="http://jasonwoof.org/vor?"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
optdepends=('netpbm: for customizing game graphics'
            'povray: for customizing game graphics')
source=(http://qualdan.com/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname.desktop $pkgname.png)
md5sums=('9a4aebdeb4f14d337fe6af40d965d798'
         '14e6f8c2ff47552d55fe4b794c9feeb5'
         'dd2aae5ec1cf1bfee5813582645681d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr CFLAGS="$CFLAGS" LDFLAGS=-lm
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" install
  install -Dm644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
