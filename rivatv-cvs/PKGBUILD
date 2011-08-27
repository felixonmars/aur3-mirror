# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=rivatv-cvs
pkgver=CVS_2006_04_29
pkgrel=1
license=GNU GPL
pkgdesc="Provide driver support for the video-in feature on nVidia video cards "
url="http://rivatv.sourceforge.net/"
groups=modules
depends=()
makedepends=('cvs' 'automake>=1.7' 'autoconf>=2.57' 'libtool')
source=()
md5sums=()

build() {
  cd $startdir/src
  msg "When asked for password, just press <ENTER>"
  cvs -d:pserver:anonymous@rivatv.cvs.sourceforge.net:/cvsroot/rivatv login
  cvs -z3 -d:pserver:anonymous@rivatv.cvs.sourceforge.net:/cvsroot/rivatv co rivatv
  rmdir $stardir/src
  mv $startdir/rivatv $startdir/src
  msg "CVS get done or server timeout"
  msg "Starting make..."
  cd $startdir/src/rivatv
  msg "Starting configure..."
  ./configure
  msg "Starting make..."
  make || return 1
  export KERNEL=`uname -a | cut -f 3 -d " "`
  mkdir -p $startdir/pkg/lib/modules/$KERNEL/kernel
  make MODULES="$startdir/pkg/lib/modules/$KERNEL/kernel" install
  rm -rf $startdir/src/
  msg "After installing package, use 'modprobe rivatv' to load the driver"
}