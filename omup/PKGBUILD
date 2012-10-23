# Maintainer: Tasos Latsas <tlatsas2000 _at_ gmail _dot_ com>

pkgname=omup
pkgver=1.1.2
pkgrel=1
pkgdesc="console-based ompldr.org uploader"
arch=('any')
url="https://github.com/tlatsas/omup"
license=('GPL3')
depends=('python')
source=("https://github.com/downloads/tlatsas/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e320da3edf7cb2b49831dbbe975e5e72')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 omup.py "$pkgdir/usr/bin/omup"
}
