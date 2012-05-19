# Contributor: hpestilence <hpestilence@gmail.com>
# Maintainer: dimik <dimik79@gmail.com>
pkgname=gtkevemon
pkgver=1.8
pkgrel=2
pkgdesc="Eve-Online skill monitor in gtk."
arch=('i686' 'x86_64')
url="http://gtkevemon.battleclinic.com/"
license=('GPL')
depends=('gtk2' 'gtkmm' 'libxml2')
source=(http://gtkevemon.battleclinic.com/releases/gtkevemon-${pkgver}-source.tar.gz
        thread.h.patch)
md5sums=('6cdf6dcb228052e4928367a0f7cd6b0a'
         '72c8606d5197dc02ab44c3634aeacc7b')

build() {

  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $startdir/thread.h.patch
  
  if [ `grep processor /proc/cpuinfo | wc -l` > 1 ] ; then
     make multicore || return 1;
  else
     make || return 1;
  fi
}

package() {
  cd $srcdir/$pkgname-$pkgver
  
  make INSTALL_BIN=$pkgdir/usr/bin \
  INSTALL_DIR_ICON=$pkgdir/usr/share/pixmaps \
  INSTALL_DIR_DESK=$pkgdir/usr/share/applications install || return 1
}
