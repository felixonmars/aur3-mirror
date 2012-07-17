#Maintainer: TingPing tingping@tingping.se
pkgname=hexchat-sasl
pkgver=0.0.4
pkgrel=1
pkgdesc='SASL plugin for Hexchat'
arch=('i686' 'x86_64')
url='http://ygrek.org.ua/p/cap_sasl.html'
license=('GPL')
depends=('hexchat')
makedepends=()
optdepends=()
source=('https://raw.github.com/gist/76296fdf65a93a351ea3/a24dff7f527831206dfdbc960476e8952a87a724/cap_sasl.c'
        'http://xchat.org/docs/xchat-plugin.h' )
md5sums=('b2bad3ecacd09cbe70fffce60fb3a7df'
         '5ee7da5abedc78a30b90e737370d8f0b')

build() {
  gcc -I /usr/include/glib-2.0 -I /usr/lib/glib-2.0/include -Wl,--export-dynamic -Wall -O1 -shared -fPIC cap_sasl.c -o cap_sasl.so
}

package() {
  mkdir -p "$pkgdir/usr/lib/hexchat/plugins"
  cp "$srcdir/cap_sasl.so" "$pkgdir/usr/lib/hexchat/plugins/"
}
