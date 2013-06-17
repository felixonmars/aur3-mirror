# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=luacairo
pkgver=1.10.2.0
pkgrel=1
pkgdesc="Lua binding of Cairo"
arch=(i686 x86_64)
url="http://www.dynaset.org/dogusanh/pgluacairo.html"
license=('GPL')
depends=('gtk2' 'lua51')
source=("http://www.dynaset.org/dogusanh/download/$pkgname-$pkgver-src.zip")
md5sums=('8422c18aadb2914bb951d362f074967f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src/src"

  # prevent from conflicting types - Region - Xutil.h
  sed -i 's/cairo-gl.h/cairo.h/' lcairo-gl-surface.c

  # FC_FONT Fix
  sed -i '64,86d;94,97d' lcairo-ft-font.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src/src"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"

  # lib
  install -Dm 755 src/lcairo.so "$pkgdir/usr/lib/lua/5.1/lcairo.so"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 doc/* "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm 644 examples/* "$pkgdir/usr/share/$pkgname/examples"
}

# vim:set ts=2 sw=2 et:
