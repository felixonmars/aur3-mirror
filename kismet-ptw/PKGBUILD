# Contributor: Asparagus Maximus <asparagus.maximus () gmail () com>

pkgname=kismet-ptw
pkgver=2011_01_R1
_realver=2011-01-R1
pkgrel=3
pkgdesc="802.11b sniffing software with aircrack-integration plugin"
arch=(i686 x86_64)
license=('GPL')
depends=('gmp' 'imagemagick' 'libpcap>=1.0.0' 'ncurses' 'dbus' 'aircrack-ng')
optdepends=(perl-libwww)
url="http://www.kismetwireless.net/"
backup=('etc/kismet.conf' 'etc/kismet_drone.conf')
source=(http://www.kismetwireless.net/code/kismet-$_realver.tar.gz)
conflicts=('kismet' 'kismet-svn')
provides=('kismet')

md5sums=('1fb1f024a7ca52814b255e2f2faccf3b')

build() {
   cd $startdir/src/kismet-$_realver

   ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
   make dep || return 1
   make ||return 1
   sed -i 's/prism2/wlanng/g' conf/kismet.conf
   make DESTDIR=$startdir/pkg install || return 1

   cd plugin-ptw/
   KIS_SRC_DIR=$startdir/src/kismet-$_realver  make ||return 1
   KIS_SRC_DIR=$startdir/src/kismet-$_realver KIS_DEST_DIR=$startdir/pkg DESTDIR=$KIS_DEST_DIR make install || return 1

}
