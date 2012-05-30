# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=guile-reader
pkgver=0.6
pkgrel=2
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/$pkgname"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile')
makedepends=('gperf')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ee7cb5c5552ef7ac26359d08b31a25f3')
install=guile-reader.install
build() {
  cd $srcdir/$pkgname-$pkgver
  CFLAGS= CPPFLAGS= LDFLAGS= GUILE_SITE=/usr/share/guile/site ./configure --prefix=/usr --with-guilemoduledir=/usr/share/guile/site
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  rm $pkgdir/usr/share/info/dir
}

