# Contributor: Roberto Alsina <ralsina@kde.org>
# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=ipsvd-dietlibc
provides=ipsvd
conflicts=ipsvd
pkgver=1.0.0
pkgrel=2
pkgdesc="A set of internet protocol service daemons for Unix, with ssl provided by matrixssl.  Compiled with dietlibc"
url="http://smarden.org/ipsvd/"
license=( custom )
makedepends=('dietlibc')
arch=('i686' 'x86_64')
source=(http://smarden.org/ipsvd/ipsvd-$pkgver.tar.gz http://ftp.debian.org/debian/pool/main/m/matrixssl/matrixssl_1.8.5.orig.tar.gz LICENSE)
md5sums=('82c8710e4beec3e92f3d9a616290232b'
         '8f02eb566368e79224ed9bab6abdf3db'
         '1af57726fa420ca9d1038b9a37d8b5af')

build() {
  echo $srcdir
  cp "$srcdir/matrixssl-1.8.5.orig/matrixssl-1-8-5-open.tar.gz" "$srcdir/net/ipsvd-$pkgver/src/matrixssl.tar.gz"
  cd "$srcdir/net/ipsvd-$pkgver/src"
  echo "/opt/diet/bin/diet -Os ${CC:-cc} ${CFLAGS:-Os -Wall}" > conf-cc
  echo "/opt/diet/bin/diet -Os ${LD:-cc} ${LDFLAGS:--s}" > conf-ld
  #patch -p3 < $startdir/src/ipsvd.patch
  echo sslio sslsvd >command.ssl
  make || return 1
  install -d "$pkgdir/sbin/"
  install -d "$pkgdir/usr/man/man8"
  install -d "$pkgdir/usr/man/man7"
  install -d "$pkgdir/usr/man/man5"
  install -D "$pkgdir/../LICENSE" "$pkgdir/usr/share/licenses/ipsvd/COPYING"

  for i in tcpsvd udpsvd ipsvd-cdb sslio sslsvd ; do
    install -m0755 $i "$pkgdir/sbin/"
  done

  install -m0644 ../man/*.8 "$pkgdir/usr/man/man8"
  install -m0644 ../man/*.7 "$pkgdir/usr/man/man7"
  install -m0644 ../man/*.5 "$pkgdir/usr/man/man5"
}
