# Maintainer: Linas <linas_fi@ymail.com>
# Old maintainers:
#  Philip A Reimer <antreimer@gmail.com>
#  Julien Quintard <mycure@gmail.com>
#  Pierre Bourdon <delroth@gmail.com>
# Contributor: Ondrej Jirman <megous@megous.com>
pkgname=mingw32-openssl
pkgver=1.0.1h
pkgrel=1
arch=('any')
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (mingw32)"
makedepends=('mingw32-gcc')
depends=('mingw32-runtime' 'mingw32-zlib')
options=(!strip !buildflags)
license=('custom:BSD')
url="http://www.openssl.org"
source=("http://openssl.org/source/openssl-$pkgver.tar.gz"
        'no-rpath.patch')
md5sums=('8d6d684a9430d5cc98a62a5d8fbda8cf'
         'dc78d3d06baffc16217519242ce92478')
sha1sums=('b2239599c8bf8f7fc48590a55205c26abe560bf8'
		 'ed1f88f5dc6f47b4373d3ff03bcb12e85e54ebae')

prepare() {
  cd "$srcdir/openssl-$pkgver"
  
  # remove rpath: http://bugs.archlinux.org/task/14367
  patch -p0 -i ${srcdir}/no-rpath.patch
  
  # Use mingw cflags instead of hardcoded ones
  sed -i -e '/^"mingw"/ s/-fomit-frame-pointer -O3 -march=i486 -Wall/-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4/' Configure
}

build() {
  cd "$srcdir/openssl-$pkgver"
  
  unset LDFLAGS
  ./Configure \
    --prefix=/usr/i486-mingw32 \
    --cross-compile-prefix=i486-mingw32- \
    -DOPENSSL_NO_CAPIENG \
    mingw \
    shared \
    zlib-dynamic
  make -j1
}

package() {
  cd "$srcdir/openssl-$pkgver"
  make -j1 INSTALL_PREFIX=$pkgdir install
  install -m644 ms/applink.c ${pkgdir}/usr/i486-mingw32/include/openssl/
  i486-mingw32-strip --strip-all $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip --strip-unneeded $pkgdir/usr/i486-mingw32/bin/*.dll
  mv ${pkgdir}/usr/i486-mingw32/lib/*.dll.a ${pkgdir}/
  i486-mingw32-strip --strip-unneeded ${pkgdir}/*.dll.a
  i486-mingw32-strip --strip-debug $pkgdir/usr/i486-mingw32/lib/*.a
  mv ${pkgdir}/*.dll.a ${pkgdir}/usr/i486-mingw32/lib/
  rm -rf $pkgdir/usr/i486-mingw32/{bin/c_rehash,ssl/misc,ssl/man}
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
