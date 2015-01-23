# Contributor: Arkranur <arkranur@gmail.com>

pkgname=grepcidr
pkgver=2.0
pkgrel=2
pkgdesc="Filter IP addresses matching IPv4 CIDR/network specification"
arch=('any')
url="http://www.pc-tools.net/unix/grepcidr/"
license=('GPL3')
depends=('glibc')
source=(http://www.pc-tools.net/files/unix/$pkgname-$pkgver.tar.gz)
md5sums=('228b0665d02c7767027245f9f608b4cb' )

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -e "s/DESTDIR=//g" -e "0,/\/local/s///g" -e "0,/CFLAGS.*/s//CFLAGS=`printf \"%s\" \"$CFLAGS\" | sed 's/O2/Ofast/g'`/g" -i Makefile
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  DESTDIR=$pkgdir make install
}

# vim:set ts=2 sw=2 et:
