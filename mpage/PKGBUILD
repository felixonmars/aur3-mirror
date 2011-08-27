# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mpage
pkgver=2.5.6
pkgrel=3
pkgdesc="Useful for laying out several pages on a single sheet of paper"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://www.mesa.nl/pub/mpage/"
license=('LGPL' 'GPL')
source=(http://www.mesa.nl/pub/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('489663c9246e47915cea931348e5175d')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's+/usr/tmp/+/tmp/+' mpage.1.in || return 1
  make LIBDIR=/usr/lib || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=$pkgdir/usr MANDIR=$pkgdir/usr/share/man/man1 \
    LIBDIR=$pkgdir/usr/lib BINDIR=$pkgdir/usr/bin install || return 1
}
