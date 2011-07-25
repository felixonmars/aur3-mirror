# Maintainer: palkeo <palkeo@gmail.com>
pkgname=stx-btree
pkgver=0.8.6
pkgrel=1
pkgdesc="A C++ implementation of a B+tree in memory, that provides structures like std::map, std::set..."
arch=(any)
url="https://idlebox.net/2007/stx-btree/"
license=('GPL')
groups=
provides=
depends=('wxgtk')
optdepends=
makedepends=
conflicts=
replaces=
install=
source=(https://idlebox.net/2007/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('552ca8419ce21b75af2fbb74aea4e253')
 
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
  rm -r $pkgdir/usr/bin
}
 
