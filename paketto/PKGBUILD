# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=paketto
pkgver=1.10
pkgrel=1
pkgdesc="Advanced TCP/IP Toolkit."
url="http://www.doxpara.com/paketto"
license="GPL"
arch=(i686)
source=(http://www.doxpara.com/paketto/$pkgname-$pkgver.tar.gz
        paketto.patch libnet.h.patch configure.patch)
md5sums=('7fd82af09a6493f24c8681f7bbf03898'
         '6311927674ef6e91cf8ea335188ee5ff'
         'e5f89a48b1e0e5f7455a82badb567871'
         '5f15c42c90d3cd6bc1acac4778cc0298')


build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 < $startdir/src/paketto.patch
  patch -p1 < $startdir/src/configure.patch
  ./configure --prefix=/usr
  patch -p1 < $startdir/src/libnet.h.patch
  make || return 1
  make DESTDIR=$startdir/pkg install
}
