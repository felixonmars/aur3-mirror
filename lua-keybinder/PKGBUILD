# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lua-keybinder
pkgver=0.2.2
pkgrel=1
pkgdesc="Lua bindings to libkeybinder, a library for registering global keyboard shortcuts"
arch=(i686 x86_64)
url="http://kaizer.se/wiki/keybinder/"
license=('GPL')
depends=('libkeybinder' 'lua')
conflicts=('keybinder')
options=('!libtool')
source=(http://kaizer.se/publicfiles/keybinder/keybinder-$pkgver.tar.gz)
md5sums=('b4ccd4bd19f3ae3f0ab2cbda11fcd3ac')

build() {
  cd "$srcdir/keybinder-$pkgver"

  ./configure \
	--prefix=/usr \
	--disable-python

  make
}

package() {
  cd "$srcdir/keybinder-$pkgver/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
