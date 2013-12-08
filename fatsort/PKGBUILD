# Maintainer: birdflesh <antkoul at gmail dot com>
# Contributor: Natan Vivo <nvivo64_gmail_com>
# Contributor: rabyte <rabyte*gmail>
# Contributor: Simon Morgan <simon@16hz.net>

pkgname=fatsort
pkgver=1.2.355
pkgrel=1
epoch=1
pkgdesc="Sorts directory structures of FAT16 and FAT32 file systems"
arch=('i686' 'x86_64')
url="http://fatsort.sourceforge.net/"
license=('GPL')
makedepends=('help2man')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('25f8c5a340581322dc8f4d676cd198f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin MANDIR=/usr/share/man/man1 install
}
