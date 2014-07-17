# $Id: PKGBUILD 112507 2014-06-02 21:55:03Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

_pkgbasename=libmemcached
pkgname=lib32-$_pkgbasename
pkgver=1.0.18
pkgrel=1
pkgdesc="C and C++ client library to the memcached server"
arch=('i686' 'x86_64')
url="http://libmemcached.org/"
license=('GPL')
depends=('glibc' 'libsasl' 'libevent')
makedepends=('perl' 'memcached' 'python-sphinx')
source=(http://launchpad.net/$_pkgbasename/1.0/$pkgver/+download/$_pkgbasename-$pkgver.tar.gz
        libmemcached-fix-linking-with-libpthread.patch)
sha256sums=('e22c0bb032fde08f53de9ffbc5a128233041d9f33b5de022c0978a2149885f82'
            '02cd903ed217ef6d023bccefecb8d599ffab9b800a4f1a4e0124f4d71888d0dc')

prepare() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  # Fix linking against libpthread (patch from Fedora)
  # https://bugzilla.redhat.com/show_bug.cgi?id=1037707
  # https://bugs.launchpad.net/libmemcached/+bug/1281907
  patch -Np1 -i ../libmemcached-fix-linking-with-libpthread.patch
}

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  CFLAGS=-m32 CXXFLAGS=-m32 LDFLAGS=-m32 ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  #make -k check
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
