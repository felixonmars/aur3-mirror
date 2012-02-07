# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=keybinder
pkgname=lib$_name
pkgver=0.2.2
pkgrel=2
pkgdesc="A library for registering global keyboard shortcuts"
arch=(i686 x86_64)
url="http://kaizer.se/wiki/$_name/"
license=('GPL')
depends=('gtk2')
conflicts=("$_name")
options=('!libtool')
source=("http://kaizer.se/publicfiles/$_name/$_name-$pkgver.tar.gz")
md5sums=('b4ccd4bd19f3ae3f0ab2cbda11fcd3ac')

build() {
  cd "$srcdir/$_name-$pkgver"

  ./configure --prefix=/usr \
              --disable-python \
              --disable-lua
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
