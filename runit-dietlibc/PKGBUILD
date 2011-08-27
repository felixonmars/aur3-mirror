# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=runit-dietlibc
pkgver=2.1.1
pkgrel=5
pkgdesc="A service supervision scheme, compiled with dietlibc"
url="http://smarden.org/runit/"
license=('custom')
arch=('i686' 'x86_64')
depends=('util-linux-ng')
provides=("runit")
conflicts=("runit")
makedepends=('dietlibc')
optdepends=("runit-services: a collection of commonly used service directories" "runit-run: to replace SysV init with runit init scheme")
install=runit.install
source=(rsvlog  http://smarden.org/runit/runit-$pkgver.tar.gz)
md5sums=('e9f0bdde366bca6fd29a9202818f3591'
         '8fa53ea8f71d88da9503f62793336bc3')

build() {
  cd "$srcdir/admin/runit-$pkgver/src"

  # configure 
  # we build static against dietlibc
  echo '/opt/diet/bin/diet -Os gcc -O2 -Wall' > conf-cc
  echo '/opt/diet/bin/diet -Os gcc -s -Os -pipe' > conf-ld
  # set default service path to /var/service
  sed -i -e 's:^char \*varservice ="/service/";$:char \*varservice ="/var/service/";:' sv.c || return 1

  # compile
  make || return 1
  make check || return 1

  install -d "$pkgdir/etc/runit/runsvdir/runit-default"
  install -d "$pkgdir/var"
  ln -s ../etc/runit/runsvdir/current "${pkgdir}/var/service" || return 1

  # install binaries
  install -d -m0755 "${pkgdir}/sbin" || return 1
  for i in `cat "$srcdir/admin/runit-$pkgver/package/commands"`
  do
    install -s -m0755 "$srcdir/admin/runit-$pkgver/src/$i" "${pkgdir}/sbin" || return 1
  done
  # man-pages
  install -d -m0755 "${pkgdir}/usr/share/man/man8" || return 1
  install -m0644 "$srcdir/admin/runit-$pkgver/man/"* "${pkgdir}/usr/share/man/man8" || return 1

  # doc
  install -d -m0755 "${pkgdir}/usr/share/doc/runit" || return 1
  install -m0644 "$srcdir/admin/runit-$pkgver/doc/"*.html "${pkgdir}/usr/share/doc/runit"  || return 1
  
  install -D "$srcdir/admin/runit-$pkgver/package/COPYING" "$pkgdir/usr/share/licenses/runit/COPYING"
}

package() {
  install -D -m0755 "rsvlog" "$pkgdir/usr/bin/rsvlog"
}
