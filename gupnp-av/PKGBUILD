# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Contributor: Denis Zawada <deno@rootnode.net>

pkgname=gupnp-av
pkgver=0.8.0
pkgrel=1
pkgdesc="GUPnP A/V is a small utility library that aims to ease the handling and \
	 implementation of UPnP A/V profiles."
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('LGPL')
groups=('gupnp')
depends=('gupnp>=0.13')
makedepends=('gtk-doc' 'pkgconfig')
options=('!libtool')
source=("http://www.gupnp.org/sites/all/files/sources/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure \
    --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('8a41a3bb60b50fceb5ece71c0dc4dcfb')
