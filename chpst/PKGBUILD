# Contributor: Paul Colomiets pc at gafol dot net
pkgname=chpst
pkgver=2.0.0
pkgrel=1
pkgdesc="Change process state utility. Allows to setuid, lock, chroot, etc. before running a file (from runit)"
url="http://smarden.org/runit/"
license=(custom)
arch=('i686' 'x86_64')
source=( http://smarden.org/runit/runit-$pkgver.tar.gz)
md5sums=('63c53d313736f444a53a7451bfa76991')
conflicts=('runit')

build() {
  cd $startdir/src/admin/runit-$pkgver/src
  echo "${CC:-gcc} ${CFLAGS:--Os}" > conf-cc
  echo "${LD:-gcc -s}" > conf-ld
  make chpst || return 1
  
  install -d $startdir/pkg/usr/sbin/
  install -d $startdir/pkg/usr/share/man/man8

  install -m0755 chpst $startdir/pkg/usr/sbin/

  install -m0644 ../man/chpst.8 $startdir/pkg/usr/share/man/man8
  install -D $startdir/src/admin/runit-$pkgver/package/COPYING $startdir/pkg/usr/share/licenses/chpst/COPYING
}
