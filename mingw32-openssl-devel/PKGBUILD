pkgname=mingw32-openssl-devel
pkgver=1.0.1beta3
upstream_pkgver=1.0.1-beta3
pkgrel=1
arch=('any')
pkgdesc="Toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS v1) protocols. Mingw32 build. (beta)"
depends=('mingw32-runtime' 'mingw32-zlib')
makedepends=(mingw32-gcc perl)
provides=(mingw32-openssl mingw32-openssl-static)
conflicts=(mingw32-openssl mingw32-openssl-static)
options=(!strip !buildflags)
backup=(usr/i486-mingw32/ssl/openssl.cnf)
license=('BSD')
url="http://www.openssl.org"
source=(http://www.openssl.org/source/openssl-$upstream_pkgver.tar.gz)
md5sums=('dc141587e0d374bdb0c7b97f770fff5e')

build()
{
  cd $srcdir/openssl-$upstream_pkgver

  ./Configure --cross-compile-prefix=i486-mingw32- \
              -DOPENSSL_NO_CAPIENG \
              --prefix=/usr/i486-mingw32 mingw shared zlib-dynamic

  make
  make INSTALL_PREFIX=$pkgdir install
  install -m755 -o 0 -g 0 libeay32.dll ssleay32.dll \
    $pkgdir/usr/i486-mingw32/bin/

  cd $pkgdir
  rm -rf usr/i486-mingw32/{bin/c_rehash,ssl/misc,ssl/man}
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/lib/engines/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
