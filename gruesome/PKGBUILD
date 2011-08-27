# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=gruesome
pkgver=0.0.3
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Roguelike in which you play a grue, lurking in the shadows and eating adventurers."
url="http://www.gruesomegames.com"
license=('GPL')
makedepends=('fpc')
source=(http://www.gruesomegames.com/${pkgname}${pkgver}.zip)
md5sums=('59f804f2645fe80d625a4c7280b31dc1')

build() {
  cd $srcdir/Gruesome
  mv source.pas gruesome.pas
  fpc gruesome.pas
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/gruesome
  cp *.pas *.txt gruesome $pkgdir/usr/share/gruesome
  ln -s /usr/share/gruesome/gruesome $pkgdir/usr/bin/gruesome
}
