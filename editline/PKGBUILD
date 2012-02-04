# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=editline
pkgver=3.0
pkgrel=20110802
pkgdesc="A BSD alternative to GNU Readline"
arch=('i686' 'x86_64')
url="http://www.thrysoee.dk/editline/"
license=('BSD')
source=('http://www.thrysoee.dk/editline/libedit-20110802-3.0.tar.gz')
md5sums=('0ea42e2c794da8ed32f6307b427f6590')


build() {
cd $srcdir
rm -rf build # start fresh
cp -ar libedit-${pkgrel}-${pkgver} build
cd build

./configure --prefix=/usr
make
make DESTDIR=$pkgdir install
}
