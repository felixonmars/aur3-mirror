# Contributor: Denis Zawada <deno@rootnode.net>

pkgname=gupnp-media-renderer
pkgver=0.1
pkgrel=2
pkgdesc="gupnp-media-renderer is a reference implementation of the MediaRenderer \
	 device type version 1"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('LGPL')
groups=('gupnp')
depends=('gupnp-vala' 'gupnp' 'gconf>=2.22' 'libgee' 'libowl-av')
makedepends=('gtk-doc' 'pkgconfig' 'vala>=0.3.4')
source=("http://www.gupnp.org/sites/all/files/sources/gupnp-media-renderer-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('22d71c89477db5c6eb62c82b2c50b31f')
