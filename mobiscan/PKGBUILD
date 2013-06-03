# Maintainer: Your Name <youremail@domain.com>
pkgname=mobiscan
pkgver=2.9.18
pkgrel=1
pkgdesc="mobiScan barcode SDK"
arch=('x86_64')
url="http://manateeworks.com/#demonstrations_controller"
license=('custom')
source=(http://manateeworks.com/uploads/files/mobiScan-Linux-Universal-v$pkgver.zip
http://manateeworks.com/uploads/files/Manatee-License-Agreement.pdf)
md5sums=('e532f78c209015f6a301e800eb760b52'
         '2e708bd574e127e40e36392d5328f79d')

package() {
  install -D -m 0644 Manatee-License-Agreement.pdf "$pkgdir/usr/share/licenses/mobiscan-sdk/LICENSE.pdf"

  cd "$srcdir/Linux-Universal"

  mkdir "$pkgdir/usr/lib/"
  install *.so "$pkgdir/usr/lib/"
  install *.a "$pkgdir/usr/lib/"
  install -D BarcodeScanner.h "$pkgdir/usr/include/manateeworks/BarcodeScanner.h"
}
