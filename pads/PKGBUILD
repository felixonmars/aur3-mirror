# Contributor: Vlatko Kosturjak <kost@linux.hr>
# Based on PADS Debian patches

pkgname=pads
pkgver=1.2
pkgrel=1
pkgdesc="Passive Asset Detection System (pads)"
url="http://passive.sourceforge.net/"
license=GPL
depends=('glibc' 'libpcap' 'pcre')
makedepends=('gcc' 'automake')
backup=(etc/pads/pads.conf)
source=('http://heanet.dl.sourceforge.net/project/passive/pads/pads-1.2/pads-1.2.tar.gz' pads-patch-deb.diff  pads-ld-asneeded.diff)
md5sums=('2a366195c55ad6b6859c4c84ce877ee8' '33c860ff83d3ec565949c670b117e400' 'aedb19c9acd2f9142d4d25b912f0bb8b');
arch=('i686' 'x86_64')


build() {
  cd $startdir/src/$pkgname-$pkgver/
  patch -p1 < $startdir/src/pads-patch-deb.diff 
  patch -p1 < $startdir/src/pads-ld-asneeded.diff 
  ./configure --prefix=/usr --sysconfdir=/etc/pads && make
  make DESTDIR="$pkgdir/" install
}
