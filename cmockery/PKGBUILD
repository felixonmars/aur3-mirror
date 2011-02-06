# Contributor: Pieter Baele <pieter.baele@gmail.com>
pkgname=cmockery
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightweight library to simplify and generalize writing unit tests for C apps"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cmockery/"
license=('APACHE')
groups=('devel')
source=(http://cmockery.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('8c5622a65f2f7527c0155a41f4db389c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
