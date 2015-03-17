# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=pytbclock
pkgver=1.0
pkgrel=1
pkgdesc="Fluid digital clock for terminal."
arch=('i686' 'x86_64')
url="http://github.com/ei-grad/pytbclock"
license=('GPL')
depends=('python-termbox-git' 'python')
makedepends=('git')
source=("pytbclock-${pkgver}.zip::https://codeload.github.com/ei-grad/$pkgname/zip/$pkgver")
md5sums=('1aef3524beef674dc58ce3a9b7d8da46')

package() {
  install -D -m755 $srcdir/$pkgname-$pkgver/$pkgname.py "$pkgdir/usr/bin/$pkgname"
} 
