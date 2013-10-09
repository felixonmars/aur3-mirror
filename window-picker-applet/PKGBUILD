# Contriburor: Balló György <ballogyor+arch at gmail dot com>
# Contriburor: michaudg

pkgname=window-picker-applet
pkgver=0.6.99 
pkgrel=1
pkgdesc="GNOME Panel applet that displays open windows as icons on the panel, and has integrated window title-bar functionality"
arch=('i686' 'x86_64')
url="https://github.com/lanoxx/window-picker-applet"
license=('GPL')
depends=('gnome-panel')
makedepends=('intltool')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/lanoxx/$pkgname/archive/$pkgver.tar.gz)
md5sums=('b2d6893cfdfb2a6ac3eb3b46f7a41058')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/ -Wall -Werror//' configure.ac
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname --disable-schemas-compile LDFLAGS="$LDFLAGS -lm"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
