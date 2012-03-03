# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=concertmaster
pkgver=0.1
pkgrel=3
pkgdesc="Linux 4k intro skeleton (demoscene)"
arch=('x86_64' 'i686')
url="http://roboticoverlords.org/concertmaster"
license=('ZLIB')
if [ "$CARCH" = "x86_64" ]
then
  depends=('lib32-libgl' 'lib32-alsa-lib' 'lib32-sdl')
else
  depends=('libgl' 'alsa-lib' 'sdl')
fi
source=("http://roboticoverlords.org/$pkgname/$pkgname-$pkgver.tbz2"
        "http://roboticoverlords.org/$pkgname/$pkgname.desktop"
        "http://roboticoverlords.org/$pkgname/$pkgname.png")
sha256sums=('a9b9dc396f67586b70931dcf36c395d4a9450f448a6332c6261579ed15ba52d2'
            'f954e517c5791f291ecefee8359543e8d4274505e2f59ecba543b1bbd695f960'
            'a3c74ce02bfe583709ed8d5d40147994362bf14f218e747a3ec3a29561b5effa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Packaging sources..."
  install -Dm644 main.c "$pkgdir/usr/src/$pkgname/main.c"
  install -Dm644 asm.s "$pkgdir/usr/src/$pkgname/asm.s"
  install -Dm644 unpackme.sh "$pkgdir/usr/src/$pkgname/unpackme.sh"
  install -Dm644 Makefile "$pkgdir/usr/src/$pkgname/Makefile"

  msg2 "Packaging binary, icon and shortcut..."
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "../$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "../$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  msg2 "Packaging license..."
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
