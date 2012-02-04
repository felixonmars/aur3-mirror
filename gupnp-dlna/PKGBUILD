# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=gupnp-dlna
pkgver=0.6.1
pkgrel=1
pkgdesc="A small utility library that aims to ease the DLNA-related tasks such as media profile guessing and transcoding"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('LGPL')
groups=('gupnp')
depends=('gstreamer0.10-base')
makedepends=()
source=("http://gupnp.org/sites/all/files/sources/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('0265d8864edcddc3367dcfe431c3bb53')
