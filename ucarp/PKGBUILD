pkgname=ucarp
pkgver=1.5.2
_patchver=1.5.1
pkgrel=1
pkgdesc="UCARP allows hosts to share virtual IP addresses to provide automatic failover."
arch=('i686' 'x86_64')
url="http://www.ucarp.org/project/ucarp"
license=('GPL2')
depends=('libpcap')
conflicts=('ucarp')
provides=('ucarp')
source=(http://download.pureftpd.org/pub/ucarp/ucarp-$pkgver.tar.gz http://ftp.de.debian.org/debian/pool/main/u/ucarp/ucarp_1.5.1-1.diff.gz)
md5sums=('e3caa733316a32c09e5d3817617e9145' 'a3c5b8cac28f1005f12a98e18bb040a7')

build() {
  mkdir -p $pkgdir/etc

  cd $srcdir/ucarp-$pkgver
  patch -Np1 -i ../ucarp_${_patchver}-1.diff

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir/ install

  install -m 755 $srcdir/ucarp-$pkgver/examples/linux/vip-down.sh $pkgdir/etc
  install -m 755 $srcdir/ucarp-$pkgver/examples/linux/vip-up.sh $pkgdir/etc

  sed -i "s|/sbin/ip|/usr/sbin/ip|g" $pkgdir/etc/vip-down.sh
  sed -i "s|/sbin/ip|/usr/sbin/ip|g" $pkgdir/etc/vip-up.sh
}
