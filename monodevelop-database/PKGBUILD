# Maintainer: wenLiangcan <boxeed@gmail.com>

pkgname=monodevelop-database
pkgver=4.2.2
_pkgver=4.2.2-2
pkgrel=2
pkgdesc="Database plugin for monodevelop"
arch=('i686' 'x86_64')
url="http://monodevelop.com"
license=('MIT')
depends=('gtk-sharp-2' 'monodevelop>=4.2.2' 'mono-addins')
makedepends=('mono')
source=(http://origin-download.mono-project.com/sources/$pkgname/$pkgname-$_pkgver.tar.bz2)
md5sums=('73dd5fbb516599d7c6393ac452f6f288')

build() {
  export MONO_SHARED_DIR="$startdir/src/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
