# Contributor: Charles-Henri d'Adhémar <cdadhemar@gmail.com>
pkgname=gedit-docwordscompletion
pkgver=0.3.1
pkgrel=1
pkgdesc="Words completion plugin for gedit"
arch=('i686')
url="http://gtksourcecomple.sourceforge.net/"
license=('GPL2')
depends=(gtksourcecompletion)
makedepends=(gtksourcecompletion)
options=('!libtool')
source=("http://downloads.sourceforge.net/gtksourcecomple/$pkgname-$pkgver.tar.bz2")
md5sums=('a4af7eb1ebd99d8a1aaa1eab836278da')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
