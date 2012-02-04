# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=supermariowar
pkgver=1.8
pkgrel=1
pkgdesc="A Super Mario multiplayer game"
arch=('x86_64' 'i686')
url="http://smw.supersanctuary.net/site/"
license=('GPL2' 'custom:fangame-please-dont-sue')
if [ "$CARCH" = "x86_64" ]
then
  depends=('lib32-sdl' 'lib32-sdl_image' 'lib32-sdl_mixer' 'lib32-libpng>=1.4')
else
  depends=('sdl' 'sdl_image' 'sdl_mixer' 'libpng12')
fi
makedepends=('wget' 'imagemagick')
source=("http://smw.supersanctuary.net/18Beta2/smw-$pkgver-beta2-linux.tar.gz"
        "supermariowar.desktop")
md5sums=('b3ec95c382fca4f33d603d12a3889347'
         '7ddab775ec4d9874030a45a3e6dec13d')

build() {
  cd "$srcdir"

  msg2 "Retrieving license..."
  wget http://smw.supersanctuary.net/site/ -O- | grep "code:" | cut -d"(" -f2 | cut -d ")" -f1 > LICENSE

  msg2 "Retrieving icon..."
  wget http://smw.supersanctuary.net/site/logo.png -O- | convert -crop 48x48+406+12 - $pkgname.png

  msg2 "Patching executables..."
  sed -i "s:/usr/share/games/smw:/usr/share/smariowar:" "usr/games/smw"
  sed -i "s:/usr/share/games/smw:/usr/share/smariowar:" "usr/games/smw-leveledit"
  sed -i "s:/usr/share/games/smw:/usr/share/smariowar:" "usr/games/smw-worldedit"
}

package() {
  cd "$srcdir/usr"

  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/smariowar"
  mkdir -p "$pkgdir/usr/bin"

  msg2 "Packaging game..."
  cp doc/smw-1.8b2/* "$pkgdir/usr/share/doc/$pkgname"
  cp games/* "$pkgdir/usr/bin"
  cp -r share/games/smw/* "$pkgdir/usr/share/smariowar"

  # Missing libpng 1.3 fix for 64-bit
  if [ "$CARCH" = "x86_64" ]
  then
    mkdir -p "$pkgdir/usr/lib32"
    ln -s /usr/lib32/libpng14.so "$pkgdir/usr/lib32/libpng.so.3"
  fi

  cd ..

  msg2 "Packaging license..."
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 "Packaging menu entry and icon..."
  install -Dm644 "../$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
