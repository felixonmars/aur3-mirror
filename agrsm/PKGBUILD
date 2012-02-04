
pkgname=agrsm
pkgver=11c11040_2.1.80~20091225
_realpkgver=11c11040-2.1.80~20091225
pkgrel=1
pkgdesc="Kernel modules for the Agere soft modem"
url="http://linmodems.technion.ac.il/packages/ltmodem/11c11040/"
license=('custom')
install=$pkgname.install
source=(http://linmodems.technion.ac.il/packages/ltmodem/11c11040/$pkgname-$_realpkgver.tar.bz2)
md5sums=('3aa76f91fa18f8cae3988c4613482dfb')
arch=("i686" "x86_64")
build() {
  cd $srcdir/$pkgname-$_realpkgver
  make || return 1
  install -Dm644 agrmodem.ko $pkgdir/lib/modules/$(uname -r)/kernel/driver/char/agrmodem.ko
  install -Dm644 agrserial.ko $pkgdir/lib/modules/$(uname -r)/kernel/driver/char/agrserial.ko
  install -Dm644 LICENSE $pkgdir/usr/licenses/$pkgname/LICENSE
}
