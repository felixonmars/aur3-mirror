# Maintainer: Georgios Tsalikis	<anaphaxeton somewhere near tsalikis and a net>

pkgname=fusekit
pkgver=0.6.5
pkgrel=1
pkgdesc="A C++ binding for FUSE."
arch=('i686' 'x86_64')
url=("http://code.google.com/p/fusekit")
license=('LGPL')
depends=('fuse')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('46836696080814e99f1daddffb44e679')

build() {
 cd $srcdir/$pkgname-$pkgver
 ./configure --prefix=/usr --with-fuse-version=29
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  
  make -j1 DESTDIR="$pkgdir" install
  
  rm $srcdir/$pkgname-$pkgver/example/*.o
  rm $srcdir/$pkgname-$pkgver/example/Makefile*
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname-$pkgver/example"  "$pkgdir/usr/share/$pkgname"
}
