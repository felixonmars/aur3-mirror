#Maintainer: Abilng<mail@abilng.in>;
pkgname=python2-pjsua
pkgver=2.3
pkgrel=1
pkgdesc="pjsip in Python2"
arch=(i686 x86_64)
url="http://www.pjsip.org"
license=('GPLv2')
depends=('python2')
makedepends=('binutils gcc')
source=(http://www.pjsip.org/release/$pkgver/pjproject-$pkgver.tar.bz2)
md5sums=('8440e43242c439ae5ec30b5b85005fce')
build() {
  cd $srcdir/pjproject-$pkgver
  #export MAKEFLAGS=
  msg2 'Configuring PJSIP'
  ./configure --prefix=/usr CFLAGS="$CFLAGS -fPIC"
  msg2 'Building PJSIP'
  make
  cd $srcdir/pjproject-$pkgver/pjsip-apps/src/python/
  msg2 'Building PYTHON-PJSUA'
  #replacing python to python2
  sed s/python/python2/ -i Makefile
  make
}
package() {
  cd $srcdir/pjproject-$pkgver/pjsip-apps/src/python/
  python2 setup.py install --prefix=$pkgdir/usr
}

