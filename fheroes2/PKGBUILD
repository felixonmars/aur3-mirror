# Maintainer: mutterschiff <david.becker@gmx.org>
pkgname=fheroes2
pkgver=r2693
pkgrel=1
pkgdesc="Free implementation of Heroes of the Might and Magic II engine. SDL is used."
arch=(any)
url="http://sourceforge.net/projects/fheroes2/"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'libogg' 'libpng12')
source=(http://sourceforge.net/projects/fheroes2/files/fheroes2/${pkgname}-src-${pkgver}.tgz 'fheroes2' 'fheroes2.desktop')
md5sums=('e661059a3157143d62c4a00b9bf0648c' '58a4ed94d2d107577fe8fdaa4a91993f' '0d52069db426be17ce9dbd5deb20d4fd')
install='fheroes2.install'

build() {
  cd $srcdir/fheroes-src
  make 
}

package() {
  install -Dm644 $srcdir/fheroes2.desktop $pkgdir/usr/share/applications/fheroes2.desktop
  install -Dm755 fheroes2 $pkgdir/usr/bin/fheroes2
  install -Dm644 $srcdir/fheroes-src/image/fheroes2_32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/fheroes2.png
  install -dm755 $srcdir/fheroes-src/ $pkgdir/usr/share/fheroes2
  cp -R $srcdir/fheroes-src/* $pkgdir/usr/share/fheroes2
  chown -R $USER $pkgdir/usr/share/fheroes2
}
