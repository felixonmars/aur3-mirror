# Maintainer: Alec Ari <neotheuser@ymail.com>

pkgname=rtai-userspace
pkgver=magma
pkgrel=4
pkgdesc="RTAI userspace"
#Remove 64-bit support for now
arch=('i686')
license=('GPL2')
groups=('base')
url="https://www.rtai.org"
depends=('rtai-kernel')
makedepends=('cvs')
source=(99-rtai.rules limits.conf rtai.config)
md5sums=('6b57bd74df5722dc83663ecc8178de10'
         '3239210e74bcd17e4a57235baf4f9cc2'
         '61d9091f0211fe11ba567be65a8668a8')

build () {

  cd $srcdir
  cvs -d:pserver:anonymous@cvs.gna.org:/cvs/rtai co magma
  cd magma
  #DO NOT uncomment the make menuconfig line unless you know what you are doing
  #make menuconfig || return 1
  cp -PR $srcdir/rtai.config .rtai_config
  make || return 1
  make install DESTDIR=${pkgdir} || return 1
  #the real install dies due to a symlink so we need these three lines
  rm -rf $pkgdir/usr/realtime/include/asm
  mkdir -p $pkgdir/usr/realtime/include/asm
  cp -PR base/include/asm-i386/* $pkgdir/usr/realtime/include/asm/
  #Install limits.conf
  mkdir -p $pkgdir/etc
  mkdir -p $pkgdir/etc/security
  cp $srcdir/limits.conf $pkgdir/etc/security/limits.conf
  #Set udev rule for access to rtai_shm and rtai_fifos
  mkdir -p $pkgdir/etc/udev
  mkdir -p $pkgdir/etc/udev/rules.d
  cp -PR $srcdir/99-rtai.rules $pkgdir/etc/udev/rules.d/
}
