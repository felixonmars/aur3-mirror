# Contributor: Jens Adam (byte/jra) <j_adam@web.de>

_kernver=2.6.23-ARCH
_realver=0.9.7-9-rht-8

pkgname=pctel
pkgver=0.9.7.9_rht8
pkgrel=1
pkgdesc='Drivers for PCTel winmodems'
url='http://linmodems.technion.ac.il/pctel-linux/welcome.html'
license=('GPL' 'proprietary') # FIXME
arch=('i686')
depends=('kernel26>=2.6.23')
install=$pkgname.install
source=("http://linmodems.technion.ac.il/pctel-linux/$pkgname-$_realver.tar.gz")
md5sums=('a8fa09d0754e36673740a5ba236b3379')

build() {
  cd $startdir/src/$pkgname-$_realver/src/
# pick one of the two types supported for 2.6 kernels, or use ./configure -auto
  echo pct789 | ./configure -manual
# echo cm8738 | ./configure -manual
  make || return 1
  install -d $startdir/pkg/lib/modules/$_kernver/misc/
  install -m 644 *.ko $startdir/pkg/lib/modules/$_kernver/misc/
}
