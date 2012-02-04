# Contributor: Sascha Hoppe <mail@saschahoppe.de>
pkgname=libcnbj
pkgver=2.2
pkgrel=1
pkgdesc="Library to use canon pixus 550i/850i/950i"
arch=(i686)
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi"
license=('GPL')
source=(http://mambo.kuhp.kyoto-u.ac.jp/~takushi/debian/$pkgname-$pkgver\_0-1.tar.gz)
md5sums=(69657fc9acdea38c51d4419d67051977)

build() {
  cd $startdir/src/$pkgname-$pkgver-0/libs
  mkdir -p $startdir/pkg/usr/lib
  cp -p lib* $startdir/pkg/usr/lib
  cp -p -R bjlib $startdir/pkg/usr/lib/
}