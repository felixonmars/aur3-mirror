pkgname=ttf-muli
pkgver=1.0
pkgrel=2
pkgdesc="Muli Google Font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url=http://www.google.com/fonts/specimen/Muli
source=(https://github.com/bendavis78/ttf-muli/archive/master.zip)
md5sums=(822f9c6d820a88c0a470575dbf5b8883)
install=$pkgname.install
license=(custom:OFL)

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/$pkgname-master/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$srcdir/$pkgname-master/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}
