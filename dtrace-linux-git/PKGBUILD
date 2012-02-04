 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=dtrace-linux-git
pkgver=20110312
pkgrel=2
pkgdesc="Solaris DTrace  ported to linux as a loadable kernel module + userland utilities"
arch=('i686' 'x86_64')
url="http://www.crisp.demon.co.uk/blog/"
#official url: http://hub.opensolaris.org/bin/view/Community+Group+dtrace/WebHome
license=('CCDL' 'custom')
#legal status of this one should be approximately the same as the ZFS port
depends=('util-linux' 'kernel26-headers' 'libdwarf')
makedepends=('git' 'bison')
provides=('dtrace')
_gitroot=('git://github.com/pdmccormick/dtrace-for-linux.git')
_gitname=('dtrace')

build() {
 cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..." 

 rm -rf $srcdir/build

 cp -ar "$srcdir/$_gitname" $srcdir/build

 cd $srcdir/build

 env LC_ALL=C make -i all
}

package() {
  cd $srcdir/build
  install -d $pkgdir/usr/sbin
  install -d $pkgdir/usr/lib/dtrace/64
  install -d $pkgdir/lib/modules/$_kernver/kernel/drivers
  install -Dm755 $srcdir/build/build/dtrace $pkgdir/usr/sbin/dtrace
  install -Dm755 $srcdir/build/build/drti.o $pkgdir/usr/lib/dtrace/64/drti.o
  install -Dm644 $srcdir/build/build/driver/dtracedrv.ko $pkgdir/lib/modules/$_kernver/kernel/drivers/dtracedrv.ko
  install -Dm644 $srcdir/build/LICENCING.NOTICE $pkgdir/usr/share/licences/dtrace/LICENCING.NOTICE
  install -Dm644 $srcdir/build/README $pkgdir/usr/share/licences/dtrace/README
}
