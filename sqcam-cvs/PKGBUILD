# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=sqcam-cvs
pkgver=20090201
pkgrel=1
pkgdesc="A kernel module with support for SQ905 / DSC-2770 based webcams"
arch=('i686' 'x86_64')
url="http://sqcam.sourceforge.net/"
license=('GPL')
depends=('kernel26=2.6.27')
makedepends=('cvs')
provides=('sqcam')
conflicts=('sqcam')
install=sqcam.install

_cvsroot=":pserver:anonymous:@sqcam.cvs.sourceforge.net:/cvsroot/sqcam"
_cvsmod="sqcam26"

build() {
  cd $startdir/src

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  cd $_cvsmod
  make gamma.h || return 1
  make || return 1
  _kernelver=`uname -r`
  install -D -m 644 sqcam.ko \
   $startdir/pkg/lib/modules/$_kernelver/kernel/drivers/media/video/usbvideo/sqcam.ko
}
