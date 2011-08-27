# Contributor: Andrew Fischer <andrew_at_lightningtoads.com>

pkgname=orangefs
pkgver=2.8.4
pkgrel=1
pkgdesc="OrangeFS (a branch of PVFS) is a parallel file system designed for parallel applications sharing data across many clients in a coordinated manner."
arch=('i686' 'x86_64')
license=("LGPL")
makedepends=('kernel26-headers')
depends=('fuse')
optdepends=('gkt2: for the karma GUI')
url="http://www.orangefs.org/"
install=orangefs.install
source=("ftp://ftp.parl.clemson.edu/pub/pvfs2/$pkgname-$pkgver.tar.gz")
md5sums=('9af06b8ec626deae953713b81d4889c3')

build() {
  # Setup server and client daemon scripts
  mkdir -p $pkgdir/etc/rc.d
  mkdir -p $pkgdir/etc/conf.d
  cp $startdir/orangefs-server $pkgdir/etc/rc.d
  cp $startdir/orangefs-server.conf $pkgdir/etc/conf.d
  chmod 755 $pkgdir/etc/rc.d/orangefs-server

  _kernelver=$(eval 'uname -r')

  cd $srcdir/$pkgname || return 1

  patch -p0 < ../../orangefs.patch || return 1

  rm -rf build-$_kernelver
  mkdir -p build-$_kernelver && cd build-$_kernelver || return 1

  ../configure --prefix=/usr --with-kernel=/usr/src/linux-$_kernelver --enable-fuse --disable-segv-backtrace || return 1

  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
  chmod 644 $pkgdir/usr/lib/libpvfs2.a
}

# vim:set ts=2 sw=2 et:
