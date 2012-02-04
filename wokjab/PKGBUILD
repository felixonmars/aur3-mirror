# Contributor: Kent Gustavsson <nedo80@gmail.com>
pkgname=wokjab
pkgver=0.9.13
pkgrel=1
pkgdesc="A jabber im client that uses lots of plugins"
url="http://wokjab.nedo.se/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libglade' 'woklib' 'dbus-glib' 'sqlite3' 'gdl')
options=(!libtool)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('1bae887976be0c19c511bae37c836d9c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
