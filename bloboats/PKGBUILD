# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

pkgname=bloboats
pkgver=1.0.2
pkgrel=1
pkgdesc="A boat racing game reminiscent of Elasto Mania and X-Moto"
arch=('i686' 'x86_64')
url="http://bloboats.dy.fi/"
license=('GPL' 'custom')
depends=('mesa' 'sdl_image' 'sdl_mixer' 'sdl_net')
source=(http://mirror.kapsi.fi/bloboats.dy.fi/$pkgname-$pkgver.tar.gz
        $pkgname.desktop $pkgname.png)
md5sums=('1c59366e959d216ee5cebc62afc07862'
         '0e909191a5fd47a2993bf193dfe0bde9'
         'd9aa6e1a6843dca44515b42f82919c32')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's,copying.txt,/usr/share/licenses/bloboats/&,' src/main.cpp
  make PREFIX='' DATADIR='$(PREFIX)/usr/share/bloboats'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir" DATADIR="$pkgdir/usr/share/bloboats" install
  install -Dm644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 copying.txt "$pkgdir/usr/share/licenses/$pkgname/copying.txt"
}
