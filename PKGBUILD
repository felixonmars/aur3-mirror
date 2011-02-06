pkgname=hinventory-client
pkgver=1.3.1
pkgrel=1
pkgdesc="Hinventory-client Script to generate Hardware/Software report file in xml for H-Inventory web application"
url="http://www.h-inventory.com/"
license="GPL"
install=hinventory-client.install
source=(http://h-inventory.com/download/scripts/hinventoryLinux-$pkgver.tar.gz)
md5sums=('EC7FB8DA598FA4C9AC03427E498B0937')

build() {
  tar zxvf hinventoryLinux-$pkgver.tar.gz
  cd $startdir/src/hinventoryLinux/
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/etc
  mkdir -p $startdir/pkg/usr/share/hinventory-client
  cp hinventory.conf $startdir/pkg/etc
  cp hinventory_Linux.sh $startdir/pkg/usr/bin
  cp autoupdate.pl $startdir/pkg/usr/bin
  cp hisoap_client.pl $startdir/pkg/usr/bin
  cp TODO $startdir/pkg/usr/share/hinventory-client
  cp README $startdir/pkg/usr/share/hinventory-client
  cp CHANGESLOG $startdir/pkg/usr/share/hinventory-client
}