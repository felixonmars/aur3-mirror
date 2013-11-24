# Maintainer: perlawk

pkgname=sdbsiod
pkgver=0.1.1
pkgrel=1
pkgdesc="sdb by siod scheme"
arch=('i686' 'x86_64')
url="http://siag.nu/index.shtml"
license=("GPL")
depends=('libsdb' 'siod')
source=(http://siag.nu/pub/$pkgname/$pkgname-${pkgver}.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make 
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
	mkdir -p "$pkgdir"/usr/bin
	cp sdbsiod "$pkgdir"/usr/bin
}
md5sums=('e40eae98b5e537942c84ddb857a68327')
