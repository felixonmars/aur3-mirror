# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=gbtpd
pkgver=0.2b
pkgrel=1
pkgdesc="GTK+ BitTorrent Protocol Daemon (btpd) Interface"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gbtpd/"
license=('GPL3')
depends=('btpd' 'gtkmm' 'libsigc++')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz \
        socket_automake.patch)

build() {
  cd "$srcdir/$pkgname-0.2.1"

  patch -p1 < "$srcdir/socket_automake.patch" || return 1

  ./configure --prefix=/usr || return 1
  make
}

package() {
  cd "$srcdir/$pkgname-0.2.1"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('36877a52584329d9e96a6f210f18539f'
         '0c601b87a5a48cd31d30b44884021381')
