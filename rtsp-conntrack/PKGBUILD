
_kernver=`uname -r`

pkgname=rtsp-conntrack
pkgver=2.6.26
pkgrel=1
pkgdesc="RTSP conntrack module. Enable RTSP over NAT. For stock arch 2.6 kernel"
arch=(i686 x86_64)
license=('GPL')
url="http://mike.it-loops.com/rtsp/"
depends=('kernel26')
makedepends=('kernel26-headers') 
source=(http://mike.it-loops.com/rtsp/rtsp-module-${pkgver}.tar.gz)
md5sums=('1b9cb1c11e722fe2045fe5672521a9c6')
install=rtsp-conntrack.install

build() {

  cd $startdir/src/rtsp
  make 
  install -D -m 755 nf_conntrack_rtsp.ko "$pkgdir/lib/modules/${_kernver}/kernel/net/netfilter/nf_conntrack_rtsp.ko"
  install -D -m 755 nf_nat_rtsp.ko "$pkgdir/lib/modules/${_kernver}/kernel/net/netfilter/nf_nat_rtsp.ko"
}
