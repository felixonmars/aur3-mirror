# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Contributor: Denis Zawada <deno@rootnode.net>

pkgname=gupnp-vala
pkgver=0.10.3
pkgrel=1
pkgdesc="gupnp-vala offers Vala bindings to GUPnP framework"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('LGPL')
groups=('gupnp')
depends=('gssdp>=0.9.2' 'gupnp>=0.13.3'
         'gupnp-av>=0.5.9' 'gupnp-dlna>=0.3.0' 'vala>=0.9.5')
makedepends=('vala>=0.8.0' 'gtk-doc' 'pkgconfig')
source=("http://ftp.gnome.org/pub/GNOME/sources/gupnp-vala/0.10/gupnp-vala-$pkgver.tar.xz")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('7ffe2fff14ae8adf3111e09008862b5c')
