pkgname=dedibox-dma
pkgver=0.0.1
pkgrel=5
pkgdesc="Dedibox Monitoring Agent - A monitoring tool for dedibox server using dedibox stuff"
url="http://documentation.dedibox.fr/doku.php?id=gestion:monitoringdma"
license=""
depends=(net-snmp lm_sensors smartmontools hddtemp dmidecode perl)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
arch=(i686 x86_64)
install=
source=(ftp://ftp.dedibox.fr/pub/dedibox/packages/binary/$pkgname\_$pkgver-$pkgrel.tar.gz http://www.syskall.net/~tapi/dedibox-dma/install.sh)
md5sums=(6916ca060243a24acc56d48b623ecd97)

build() {
  cd $startdir/src/$pkgname
  mkdir -p $startdir/pkg/etc/snmp $startdir/pkg/etc/default
  mv check-disk.sh check-md.pl dma-ver.sh snmpd.conf snmptrapd.conf $startdir/pkg/etc/snmp
  mv snmpd.defaults $startdir/pkg/etc/default/snmpd
}
