# Contributor: Mark Baran <mebaran@gmail.com>
pkgname=libmtag-ruby
pkgver=0.2.0
pkgrel=1
pkgdesc="libmtag-ruby provides ruby bindings for libmtag "
arch=('i686' 'x86_64')
url="http://code.google.com/p/libmtag/"
license=('LGPL')
groups=
provides=
depends=('libmtag')
makedepends=('gcc')
source=(http://libmtag.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a49e35f4196752998f3cc539051a51e7')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby extconf.rb --prefix=/usr
  make || return 1
  make install prefix=$startdir/pkg/usr install
}
