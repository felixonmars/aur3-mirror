# Contributor: Jeremy Cowgar <jeremy@cowgar.com>
pkgname=vstr
pkgver=1.0.15
pkgrel=1
pkgdesc="C string library"
license=('GPL')
url="http://www.and.org/vstr/"
source=(ftp://ftp.and.org/pub/james/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('578061d198bfe2d30b28b75ef8d92ceb')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
