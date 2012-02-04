# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=kitsh
pkgver=0.42
pkgrel=1
pkgdesc="A tasteless WebKit shell."
arch=(i686 x86_64)
url="http://code.google.com/p/kitsh/"
license=('GPL3')
depends=('libwebkit')
install="$pkgname.install"
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2"
        "$pkgname.desktop")
md5sums=('a0d548465c5e28a7dfa1d0dbdcfb27bc'
         '6e8b53b2c4a99099d09ca51670b550b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sh $pkgname.c
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # data
  install -d "$pkgdir/usr/share/$pkgname"
  install -Dm644 $pkgname.{jsh,png,jsl} readme.txt \
    "$pkgdir/usr/share/$pkgname"

  # lib
  install -Dm644 lib/jquery.js "$pkgdir/usr/share/$pkgname/lib/jquery.js"

  # tests
  cp -a tests "$pkgdir/usr/share/$pkgname"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 doc/* "$pkgdir/usr/share/doc/$pkgname"

  # desktop file and icon
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
