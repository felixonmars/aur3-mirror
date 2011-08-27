# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=twibble
pkgver=0.5.1
pkgrel=1
pkgdesc="Twitter client using Adobe AIR"
arch=('i686' 'x86_64')
url="http://www.twibble.de/twibble-desktop/"
license=('custom')
depends=('adobe-air')
source=(http://www.twibble.de/sw/desktop/twibble2.air 'LICENSE' 'twibble.sh')
md5sums=('ad0012a9614f34d7f270f0dd38cc22d7' \
         '7ef99a04e48f8dc3132ff8e1754fbe52' \
         '3d70b6f554a76bd8fedafa2344c198bf') 

build() {
  cd $srcdir/

  install -d $pkgdir/{opt/$pkgname,usr/{share/licenses/$pkgname,bin}}
  install twibble2.air $pkgdir/opt/$pkgname/
  install -m755 twibble.sh $pkgdir/usr/bin/twibble
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
