# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=fuse-cuse
pkgver=2.8.0_pre2
_basever=2.8.0
_realpkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Filesystem in Userspace with CUSE support"
arch=('i686' 'x86_64')
url="http://userweb.kernel.org/~tj/ossp/"
license=('GPL2')
depends=('glibc')
makedepends=('pkgconfig')
provides=("fuse=${pkgver}")
conflicts=('fuse')
backup=("etc/fuse.conf" "etc/udev/rules.d/99-fuse.rules")
install="fuse.install"
source=("http://userweb.kernel.org/~tj/ossp/fuse-${_realpkgver}-cuse.tar.gz"
        "fuse.conf")
options=(!libtool)
md5sums=('aad8b490dd836dde91a55ce52e845ac1'
         'c9457cf5b2196da67d5ac816d1c86a4f')

build() {
  cd ${srcdir}/fuse-${pkgver/_/-}
  ./configure --prefix=/usr --disable-kernel-module --enable-lib \
              --enable-util --bindir=/bin
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # static device nodes will cause collision.
  rm -rf ${pkgdir}/dev
 
  # Remove init script in wrong path
  # Don't add our own for now, as fusectl fs oopses on 2.6.18
  rm -rf ${pkgdir}/etc/init.d
  #install -D -m755 ${srcdir}/fuse.rc.d ${pkgdir}/etc/rc.d/fuse

  install -d ${pkgdir}/lib
  mv ${pkgdir}/usr/lib/libfuse.so.${_basever} ${pkgdir}/lib/ || return 1
  ln -s ../../lib/libfuse.so.${_basever} ${pkgdir}/usr/lib/libfuse.so.${_basever} || return 1
  ln -s libfuse.so.${_basever} ${pkgdir}/lib/libfuse.so.2 || return 1
  mv ${pkgdir}/usr/lib/libulockmgr.so.1.0.1 ${pkgdir}/lib/ || return 1
  ln -s ../../lib/libulockmgr.so.1.0.1 ${pkgdir}/usr/lib/libulockmgr.so.1.0.1 || return 1
  ln -s libulockmgr.so.1.0.1 ${pkgdir}/lib/libulockmgr.so.1 || return 1

  # install sample config file
  install -Dm644 ${srcdir}/fuse.conf ${pkgdir}/etc/fuse.conf
}

# vim:set ts=2 sw=2 et:
