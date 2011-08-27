# Contributor: Denis Zawada <deno@rootnode.net>

pkgname=gupnp-ui
pkgver=0.1.1
pkgrel=2
pkgdesc="GUPnP-UI provides a collection of simple GTK+ widgets on top of GUPnP"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('LGPL')
groups=('gupnp')
depends=('gtk2' 'gupnp>=0.3')
makedepends=('gtk-doc' 'pkgconfig')
provides=('libgupnp-ui')
options=('!libtool')
source=("http://www.gupnp.org/sites/all/files/sources/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('5ca6b3f6740d0295066b0b533289aa4c')
