# Maintainer: Trevor Martin <diggingman[at]gmail[dot]com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=iscan-plugin-gt-x770
pkgver=2.1.2
_realpkgver=2.1.2-1
pkgrel=2
pkgdesc="iscan plugin for Epson Colorio GT-X770/Perfection Photo V500 scanners."
arch=('i686' 'x86_64')
url="http://www.epson.com"
license=('custom')
depends=('iscan')
install=gt-x770.install

[ "$CARCH" = x86_64   ] && 
source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/38/452bf811fca094367e871911a507e739a978489f/iscan-plugin-gt-x770-2.1.2-1.x86_64.rpm)
[ "$CARCH" = i686   ] && 
source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/38/c8f0ccb2effabe926265d64910118a953e62c67c/iscan-plugin-gt-x770-2.1.2-1.i386.rpm)

[ "$CARCH" = x86_64   ] && md5sums=('535cd0f66a17da65fbe3f4e43891785c')
[ "$CARCH" = i686   ] && md5sums=('c1653cac46ddc1c927953ffca588bf01')

package() {
  cd "$srcdir"
  [ "$CARCH" = x86_64   ] && mv "$srcdir"/usr/lib64 "$srcdir"/usr/lib
  mv usr "$pkgdir"
  mkdir "$pkgdir"/usr/share/licenses
  mv "$pkgdir"/usr/share/doc/$pkgname-$pkgver "$pkgdir"/usr/share/licenses/
  rm -rf "$pkgdir"/usr/share/doc
}


