# Maintainer: Mika Hynnä 'ighea' igheax at gmail dot com 
pkgname=syck
pkgver=0.55
pkgrel=3
pkgdesc="An extension for reading and writing YAML swiftly in popular scripting languages."
#url="http://whytheluckystiff.net/syck/"
url="http://rubyforge.org/projects/syck/"
license=('BSD')
arch=('x86_64' 'i686' 'arm')
source=(http://rubyforge.org/frs/download.php/4492/$pkgname-$pkgver.tar.gz
	syck-0.55-64bit.patch)
md5sums=('a57b7c46d81170b9318e2f384f77910c'
         '899fd0c9ab9652ef207048c7eb072103')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  patch -Np1 < ../syck-0.55-64bit.patch
  ./configure --prefix=/usr
  
  # Append -fPIC to CFLAGS
  sed s/'CFLAGS ='/'CFLAGS = -fPIC'/ -i Makefile

  make || return 1
  make check || return 1
  make DESTDIR=$pkgdir install
}
