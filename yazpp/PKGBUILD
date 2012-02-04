# Maintainer: Peter Lewis <prlewis@letterboxes.org>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=yazpp
pkgver=1.2.1
pkgrel=3
pkgdesc="A toolkit supporting the development of Z39.50/SRW/SRU clients and servers - C++ bindings"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.indexdata.dk/yaz"
depends=('yaz')
options=('!libtool')
source=(http://ftp.indexdata.dk/pub/yazpp/$pkgname-$pkgver.tar.gz)
md5sums=('b25477c83e84ca581af57a6f61e3f9ba')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
