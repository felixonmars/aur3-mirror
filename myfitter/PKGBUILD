# Maintainer: Tong <piggy1983@gmail.com>
pkgname=myfitter
_realname=myfitter
pkgver=0.1.1
pkgrel=1
pkgdesc="myFitter is a C++ class library for maximum likelihood fits and the numerical computation of p-values in likelihood ratio tests."
url="http://myfitter.hepforge.org"
arch=('i686' 'x86_64')
depends=('dvegas' 'boost' 'gsl')
license=('GPLv2')
source=("http://www.hepforge.org/archive/myfitter/$pkgname-$pkgver.tar.gz")
md5sums=('37fac99d140fe5fc6998a0831f758576')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  cd $pkgdir/usr
}
