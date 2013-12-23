# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>

# Custom properties used in PKGBUILD and auto-package creation.
_filename_exp=ipacutil_[#_#].tar.gz
_force_update=n
_category='system'

pkgname=ipacutil
pkgver=0.7
pkgrel=1
pkgdesc="I-PAC USB keyboard encoder programming utility for Linux."
arch=('any')
url="http://www.zumbrovalley.net"
license=('GPL')
changelog=ChangeLog
install=ipacutil.install
depends=('lib32-libusb-compat')
source=("http://www.zumbrovalley.net/ipacutil/dnld/ipacutil_0_7.tar.gz")
md5sums=('ffd0a1040fc2bf83c1c3ba5804262ea6')

build() {

  cd "$srcdir/ipacutil_0_2"
  sed -r 's:((BIN|MAN)DIR=).?(/):\1$(DESTDIR)\3:g;s:(gcc):\1 LIBRARY_PATH=/usr/lib:g' Makefile > Makefile.NEW
  mv Makefile.NEW Makefile

  export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

  make
}

package() {
 
  mkdir -pv $pkgdir/usr/bin $pkgdir/usr/share/man/man5 $pkgdir/usr/share/ipacutil

  cd "$srcdir/ipacutil_0_2"

  cp config/*.cfg $pkgdir/usr/share/ipacutil
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
