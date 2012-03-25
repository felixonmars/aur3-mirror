# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adg-lua
pkgver=0.0.1
pkgrel=1
pkgdesc="Automatic Drawing Generation lua bindings, based on lgob"
arch=(i686 x86_64)
url="http://adg.entidi.com/"
license=('GPL3')
depends=('adg' 'lgob')
makedepends=('libtool' 'luaexpat')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/adg/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('312ab6e7d2ba891f3d79e9ef00ad0926')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
