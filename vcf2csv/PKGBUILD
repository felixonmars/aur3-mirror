# Maintainer: josephgbr <rafael.f.f1@gmail.com>
pkgname=vcf2csv
pkgver=0.6
_ver=201011061941
pkgrel=1
pkgdesc="Converts a vcard file to a CSV list or simple HTML page"
arch=('i686' 'x86_64')
url="http://vcf2csv.sourceforge.net/"
license=('GPL')
depends=('glibc')

_dirname=$pkgname-$pkgver-$_ver-src-bin
source=("http://downloads.sourceforge.net/$pkgname/$pkgname/$_dirname.tgz")
md5sums=('fdec9af76f506accb685c824fce19b9b')

build() {
  cd "$srcdir/$_dirname"
  sed -i 's/2008/2008-2010/' src/vcf2csv.c
  make all
}

package() {
  cd "$srcdir/$_dirname"
  install -Dm755 src/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 src/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}

