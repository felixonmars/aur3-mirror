# Maintainer: Kevin Berry <deathsyn@gmail.com>
pkgname=socklog-dietlibc
pkgver=2.1.0
pkgrel=3
pkgdesc="System and kernel logging services, compiled with dietlibc"
url="http://smarden.org/socklog/"
license=('custom')
arch=('i686' 'x86_64')
depends=()
provides=("socklog")
conflicts=("socklog")
makedepends=('dietlibc')
optdepends=("runit-dietlibc: a supervised init for UNIX systems" "daemontools: an older (but compatible) process supervision system")
install=socklog.install
source=( http://smarden.org/socklog/socklog-$pkgver.tar.gz)
md5sums=('5d0e8e28c9329ad3af982c5241df9ff1')

build() {
  cd $srcdir/admin/socklog-$pkgver/src

  # configure 
  # we build static against dietlibc
  echo '/opt/diet/bin/diet -Os gcc -O2 -Wall' > conf-cc
  echo '/opt/diet/bin/diet -Os gcc -s -Os -pipe' > conf-ld
  # set default kernel message path to /proc/kmsg
  sed -i -e 's:^#define _PATH_KLOG "\/dev\/klog"$:#define _PATH_KLOG "\/proc\/kmsg":' socklog-conf.c || return 1

  # compile
  make || return 1
  make check || return 1
}

package() {
  # install binaries
  install -d -m0755 ${pkgdir}/sbin || return 1
  for i in `cat $srcdir/admin/socklog-$pkgver/package/commands`
  do
    install -s -m0755 $srcdir/admin/socklog-$pkgver/src/$i ${pkgdir}/sbin || return 1
  done

  # man-pages
  install -d -m0755 ${pkgdir}/usr/share/man/man8 || return 1
  install -m0644 $srcdir/admin/socklog-$pkgver/man/* ${pkgdir}/usr/share/man/man8 || return 1

  # doc
  install -d -m0755 ${pkgdir}/usr/share/doc/socklog || return 1
  install -m0644 $srcdir/admin/socklog-$pkgver/doc/*.html ${pkgdir}/usr/share/doc/socklog  || return 1
  
  install -D $srcdir/admin/socklog-$pkgver/package/COPYING $pkgdir/usr/share/licenses/socklog/COPYING
}
