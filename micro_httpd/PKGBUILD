# Contributor: bender02 <bender02@gmx.com>
pkgname=micro_httpd
pkgver=20051212
pkgrel=1
pkgdesc="Micro http server: insecure, slow, but incredibly small"
url="http://www.acme.com/software/micro_httpd/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('xinetd')
makedepends=('dietlibc')
backup=('etc/xinetd.d/micro_httpd')
source=("http://www.acme.com/software/micro_httpd/micro_httpd_12dec2005.tar.gz" \
        micro_httpd.xinetd micro_httpd.patch)
install=(micro_httpd.install)
md5sums=('6b30494bbfc14c5004b2eed8a194a363' '3eb26355b4b69af2f7a8deecc5d628ad' 'b4ce402812fdee2451984a00cd9a8cfa')

build() {
  cd $srcdir/micro_httpd
  sed -i -e '/CC/s:gcc:/opt/diet/bin/diet gcc:' Makefile
  patch micro_httpd.c $srcdir/micro_httpd.patch
  make || return 1
  install -D -m 755 micro_httpd $pkgdir/usr/bin/micro_httpd || return 1
  install -D -m 644 micro_httpd.8 $pkgdir/usr/man/man8/micro_httpd.8 || return 1
  install -D -m 644  $srcdir/micro_httpd.xinetd $pkgdir/etc/xinetd.d/micro_httpd || return 1
}
