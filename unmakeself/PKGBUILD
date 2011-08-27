# Maintainer: kevku <kevku@gmx.com>
pkgname=unmakeself
pkgver=1.1
pkgrel=1
pkgdesc="Makeself archive extractor"
arch=('x86_64' 'i686')
url="http://www.freshports.org/archivers/unmakeself"
license=('BSD')
depends=('libarchive')
source=("http://ftp.eenet.ee/gentoo/distfiles/unmakeself-1.1.tar.gz")
md5sums=('d4124923477efc5b071adc733192cd3a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc unmakeself.c -larchive -o unmakeself
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 unmakeself $pkgdir/usr/bin/unmakeself
}
