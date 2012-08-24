# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Original Arch Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libmemcached-hphp
_pkgname=libmemcached
pkgver=0.53
pkgrel=1
pkgdesc="C and C++ client library to the memcached server - old version to be used with HipHop"
arch=('i686' 'x86_64')
url="http://libmemcached.org/"
license=('GPL')
depends=('glibc' 'libsasl' 'libevent')
makedepends=('perl')
options=('!libtool')
source=(http://launchpad.net/${_pkgname}/1.0/$pkgver/+download/${_pkgname}-$pkgver.tar.gz)
sha256sums=('2386e3ed4c63bd3bc8f2ddbb7636c09da2f58e10aff4340f488fcf0d77b0e58b')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  # memcached is needed only in `make test', therefore we pass
  # --without-memcached to the configure script to skip it
  ./configure --prefix=/opt/hiphop --without-memcached
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  make DESTDIR="$pkgdir" install
}


