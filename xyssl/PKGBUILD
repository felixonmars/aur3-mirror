# Contributor: Yura Siamashka <yurand2@gmail.com>

pkgname=xyssl
pkgver=0.9
pkgrel=1
pkgdesc="Cryptographic library for embedded systems"
arch=('i686')
url="http://xyssl.org/"
license=('GPL' 'BSD')
depends=('glibc')
#source=(http://xyssl.org/code/download/$pkgname-$pkgver-gpl.tgz)
source=(ftp://140.211.166.134/.2/gentoo/distfiles/$pkgname-$pkgver-gpl.tgz)
md5sums=('3f0695831aa874cb77e3790755d6b570')

build() {
  cd $startdir/src/$pkgname-$pkgver/library
  
  sed -i '15iCFLAGS += -fPIC' Makefile

  make static || return 1
  make shared || return 1
  
  cd $startdir/src/$pkgname-$pkgver
  
  make install DESTDIR="$startdir/pkg/usr"  
}

