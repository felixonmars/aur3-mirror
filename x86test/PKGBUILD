# Contributor: Charlos <hunarch@devall.hu>
pkgname=x86test
pkgver=0.10a
pkgrel=1
pkgdesc="Bootable utility for PCs that information about the boot CPU"
arch=('i686')
url="http://www.vortex.prodigynet.co.uk/x86test"
license=('GPL2')
options=('!strip' '!libtool')
install=('x86test.install')
source=(http://www.vortex.prodigynet.co.uk/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('5ba130f7e8b2ab22be81002f885f12bc')
sha1sums=('4b1fafd890fa1bf448e56d983fcd40f0fec9fb25')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make x86test_zImage || return 1
  mkdir -p $startdir/pkg/boot/x86test
  install -m 644 -D $startdir/src/$pkgname-$pkgver/x86test_zImage $startdir/pkg/boot/x86test/x86test_zImage
}
