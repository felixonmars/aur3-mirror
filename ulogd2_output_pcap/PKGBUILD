# Maintainer: Andrzej Boreczko <0rion@wp.pl>
# Contributor: Andrzej Boreczko <0rion@wp.pl>

pkgname=ulogd2_output_pcap
pkgver=2.0.0
pkgrel=5
pkgdesc="libpcap output plugin for ulogd-2.x"
arch=(i686 x86_64)
url="http://www.netfilter.org/projects/ulogd/index.html"
license=('GPL')
depends=('ulogd2' 'libpcap>=0.9.8')
source=("http://www.netfilter.org/projects/ulogd/files/ulogd-${pkgver}.tar.bz2")
md5sums=('211e68781e3860959606fc94b97cf22e')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/ulogd-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --program-suffix=2
  make || return 1
}

package() {
  cd $startdir/src/ulogd-${pkgver}
  install -D -s -m755 $startdir/src/ulogd-${pkgver}/output/pcap/.libs/ulogd_output_PCAP.so $startdir/pkg/usr/lib/ulogd/ulogd_output_PCAP.so
}
