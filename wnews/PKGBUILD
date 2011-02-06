# Packager: H.Gokhan SARI <hsa2@difuzyon.net>
pkgname=wnews
pkgver=0.8
pkgrel=1
pkgdesc="rss reader for your terminal"
arch=(i686)
url="http://kerneled.org/site/?q=node/5"
license=('GPL')
source=(http://carte.kerneled.org/releases/wnews-0.8.tar.gz)
md5sums=('541c9170f4324eafaf78ca5cfb9efab5')

build() {
  mkdir -p $pkgdir/usr/bin
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make install
  cd $startdir/src/$pkgname-$pkgver/src
  install -m755 wnews $pkgdir/usr/bin
}