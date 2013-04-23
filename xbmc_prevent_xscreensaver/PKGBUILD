# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xbmc_prevent_xscreensaver'
pkgver=1.12
pkgrel=1
pkgdesc='Keep xscreensaver from coming on when xbmc is active.'
arch=('any')
url='https://github.com/graysky2/xbmc_prevent_xscreensaver'
depends=('xscreensaver' 'xbmc')
license=('MIT')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('25299243090f4a76458dda9a2ba8d2e7b363710f6914ffe4475584bba5d8bfb0')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
