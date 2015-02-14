# Contributor: danitool
pkgname=cramfsswap
pkgver=1.4.1
pkgrel=1
pkgdesc="swap endianess of a cram filesystem (cramfs)"
url="https://packages.debian.org/sid/cramfsswap"
license=("GPL")
arch=('i686' 'x86_64')
source=(http://ftp.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.tar.gz)
md5sums=('c556b8965d3834fa0529b4a1f9843882')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -m 755 -D cramfsswap $pkgdir/usr/bin/cramfsswap || return 1
}
