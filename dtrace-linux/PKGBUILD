 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=dtrace-linux
pkgver=20110718
pkgrel=1
pkgdesc="Solaris DTrace  ported to linux as a loadable kernel module + userland utilities"
arch=('i686' 'x86_64')
url="http://www.crisp.demon.co.uk/blog/"
#official url: http://hub.opensolaris.org/bin/view/Community+Group+dtrace/WebHome
#another blog: http://crtags.blogspot.com/
license=('CCDL' 'custom')
#legal status of this one should be approximately the same as the ZFS port
depends=('util-linux' 'linux-headers' 'libdwarf' 'solaris-pl')
makedepends=('bison' 'elfutils' 'zlib' 'flex')
provides=('dtrace')
source=("ftp://crisp.dyndns-server.com/pub/release/website/dtrace/dtrace-$pkgver.tar.bz2" "lex.patch")
md5sums=('b33feaea2d5a77320c06b10304cbfe65' '4416559825ecaa8fc53da27ce1f515a8')

_kernver=$(uname -r)

build() {
 export CC=gcc
 export CXX=g++
 export CFLAGS="$CFLAGS -I$srcdir/build/include -I$srcdir/build/linux -I/usr/src/spl-0.6.0/$_kernver"
 export CXXFLAGS="$CXXFLAGS -I$srcdir/build/include -I$srcdir/build/linux -I/usr/src/spl-0.6.0/$_kernver"
 cd $srcdir

 rm -rf $srcdir/build
 cp -ar "$srcdir/dtrace-$pkgver" $srcdir/build

  cd $srcdir/build
  patch -p0 $srcdir/build/libdtrace/dt_impl.h $srcdir/lex.patch
  make -i all
  make install
}

package() {

  cd $srcdir/build
  mkdir -p $pkgdir/usr/sbin
  mkdir -p $pkgdir/usr/lib/dtrace/64
  mkdir -p $pkgdir/lib/modules/$_kernver/kernel/drivers

  install -m755 $srcdir/build/build/dtrace $pkgdir/usr/sbin/dtrace
  install -m755 $srcdir/build/build/drti.o $pkgdir/usr/lib/dtrace/64/drti.o
  install -m644 $srcdir/build/build/driver/dtracedrv.ko $pkgdir/lib/modules/$_kernver/kernel/drivers/dtracedrv.ko

  install -Dm644 $srcdir/build/LICENSING.NOTICE $pkgdir/usr/share/licenses/dtrace/LICENSING.NOTICE
  install -Dm644 $srcdir/build/README $pkgdir/usr/share/licenses/dtrace/README
}
