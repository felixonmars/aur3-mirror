# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Michele Vascellari <michele.vascellari@gmail.com>

pkgname=gtkmm-utils
pkgver=0.4.1
pkgrel=2
pkgdesc="High level utility functions/classes/widgets for gtkmm and glibmm"
arch=('i686' 'x86_64')
url="http://gtkmm-utils.googlecode.com/"
license=('GPL')
depends=('gtkmm')
makedepends=('pkgconfig>=0.9.0')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz
        $pkgname-glib.diff)
md5sums=('8b9d5503aaba434f5811e530208962b3'
         '6eeb14f58b017573426b344feb4e1894')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-glib.diff"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
