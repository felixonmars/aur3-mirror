# Maintainer: Neale Pickett <neale@woozle.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=ipsvd
pkgver=1.0.0
pkgrel=8
pkgdesc="A set of internet protocol service daemons for Unix"
url="http://smarden.org/ipsvd/"
license=( custom )
depends=()
arch=('i686' 'x86_64')
source=(http://smarden.org/ipsvd/$pkgname-$pkgver.tar.gz http://ftp.debian.org/debian/pool/main/m/matrixssl/matrixssl_1.8.8.orig.tar.gz LICENSE)
md5sums=('82c8710e4beec3e92f3d9a616290232b'
         'c8102e40a92c7571c3890686e0bfeac4'
         '1af57726fa420ca9d1038b9a37d8b5af')


build() {
  cp $srcdir/matrixssl-1-8-8-open.tgz $srcdir/net/$pkgname-$pkgver/src/matrixssl.tar.gz
  cd $srcdir/net/$pkgname-$pkgver/src
  echo "${CC:-cc} ${CFLAGS:-Os -Wall}" > conf-cc
  echo "${LD:-cc} ${LDFLAGS:--s}" > conf-ld
  #patch -p3 < $srcdir/ipsvd.patch
  echo sslio sslsvd >command.ssl
  make || return 1
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/usr/man/man8
  install -d $pkgdir/usr/man/man7
  install -d $pkgdir/usr/man/man5
  install -D $srcdir/LICENSE $pkgdir/usr/share/licenses/ipsvd/COPYING

  for i in tcpsvd udpsvd ipsvd-cdb sslio sslsvd ; do
    install -m0755 $i $pkgdir/usr/bin/
  done

  install -m0644 ../man/*.8 $pkgdir/usr/man/man8
  install -m0644 ../man/*.7 $pkgdir/usr/man/man7
  install -m0644 ../man/*.5 $pkgdir/usr/man/man5
}
