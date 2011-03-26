# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=hamsterdb
pkgver=1.1.8
pkgrel=1
pkgdesc="A lightweight embeded "NoSQL" key-value store"
arch=('i686' 'x86_64')
url="http://hamsterdb.com"
license=('GPL')
depends=('glibc')
options=('!libtool')
source=("http://hamsterdb.com/public/dl/$pkgname-$pkgver.tar.gz")
md5sums=('9692ad691b50450c5fe39a7e81cd16b5')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr 
  
  make
  }

package() 
{
  cd $srcdir/$pkgname-$pkgver
  
  make DESTDIR=$pkgdir install
}

