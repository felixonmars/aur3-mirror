# Contributor: Michael Kanis <mkanis@gmx.de>
# Contributor: Charles-Henri d'Adhémar <cdadhemar@gmail.com>
pkgname=gtksourcecompletion
pkgver=0.5.2
pkgrel=2
pkgdesc="Source code completion for the GtkSourceView library"
arch=('i686' 'x86_64')
url="http://gtksourcecomple.sourceforge.net/"
license=('LGPL3')
depends=('gtksourceview2')
options=('!libtool')
source=("http://downloads.sourceforge.net/gtksourcecomple/$pkgname-$pkgver.tar.gz")
md5sums=('b031896ce03bef4ca711f9b1e0a34544')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

