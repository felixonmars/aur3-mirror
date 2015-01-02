# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xbmc-prevent-xscreensaver'
pkgver=1.15
pkgrel=1
pkgdesc='Keep xscreensaver from coming on when xbmc is active.'
arch=('any')
url='https://github.com/graysky2/xbmc-prevent-xscreensaver'
depends=('xscreensaver' 'xbmc')
conflicts='xbmc_prevent_xscreensaver'
replaces='xbmc_prevent_xscreensaver'
license=('MIT')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('417353f60025c2141327a91a7165447d3035149420e87b66cf7036d2713d6478')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
