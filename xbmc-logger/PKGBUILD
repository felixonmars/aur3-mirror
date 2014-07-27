# Maintanier: graysky <graysky AT archlinux dot us>
pkgname=xbmc-logger
pkgver=1.2
pkgrel=1
pkgdesc='Keeps track of every video you watch on xbmc.'
arch=('any')
license=('MIT')
url="https://github.com/graysky2/xbmc-logger"
depends=('perl')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('b844fccd92961512f1747bea30655dd8e7a016ed5e0f34cd9dfb398a49c72202')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
