# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
# Based on activdriver package made by cbuehler
pkgname=activdriver-i686
_pkgname=activdriver
pkgver=5.7.22
pkgrel=1
pkgdesc="The kernel mode and X11 drivers for Promethean ActivBoard and ActivHub - i686 version."
arch=('i686')
url="http://www.prometheanworld.com/"
license=('unknown')
depends=(bash)
makedepends=(kernel26-headers)
provides=("activdriver")
install=$_pkgname.install
source=(http://activsoftware.co.uk/linux/repos/ubuntu/pool/oss/a/$_pkgname/${_pkgname}_$pkgver-12~ubuntu~1010_i386.deb
        10-promethean.conf)
md5sums=('18716673e50014616feca6b8447c0b01'
         '11effc25fd592acacb9f9f3108618963')

build() {
  tar xf data.tar.gz
  make -C /lib/modules/$(uname -r)/build SUBDIRS="$srcdir/usr/src/promethean/kernel" modules
  sed -i "s%KERN_INC = /usr/src/promethean%KERN_INC = ..%" usr/src/promethean/activlc/Makefile
  BUILD=release make -C usr/src/promethean/activlc
  sed -i s%/usr/local/bin/%%g usr/bin/promethean.sh
}

package() {
  mkdir -p $pkgdir/usr 
  cp -r etc lib $pkgdir
  cp -r usr/bin usr/lib usr/share $pkgdir/usr
  install -D usr/src/promethean/activlc/release/activlc $pkgdir/usr/bin/activlc
  install -D usr/src/promethean/kernel/promethean.ko \
    $pkgdir/lib/modules/$(uname -r)/kernel/drivers/input/tablet/promethean.ko
  install -D 10-promethean.conf $pkgdir/etc/X11/xorg.conf.d/10-promethean.conf
}
