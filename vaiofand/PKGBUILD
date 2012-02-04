# Maintainer: David Jurenka <arch.box NO-SP@M imx.jurenka DOT cz>
pkgname=vaiofand
pkgver=0.10.1
pkgrel=1
pkgdesc="Fan controller for Sony Vaio laptops"
arch=(i686 x86_64)
url="http://vaio-utils.org/fan/"
license=('custom:ISC')
depends=(bash)
makedepends=(linux-headers)
backup=(etc/vaiofand.conf)
install=vaiofand.install
source=(http://vaio-utils.org/download/$pkgname-$pkgver.tar.xz)
md5sums=(a92da6b137f7f831ff82c69b18822096)
sha256sums=(88f304e72645410bf9f63908b54ba80e58ef3bf6e425959391c04e8cec819c5f)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir/" copy
  # rc.d script
  install -d "${pkgdir}/etc/rc.d"
  install "init-scripts/arch/${pkgname}" "${pkgdir}/etc/rc.d"
  # license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
