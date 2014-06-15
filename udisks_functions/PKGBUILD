# Maintainer: ledti <antegist at gmail.com>
# https://bbs.archlinux.org/viewtopic.php?id=109307

pkgname=udisks_functions
pkgver=2
pkgrel=1
pkgdesc="Bash functions and aliases for udisks2."
arch=('any')
url="https://gist.github.com/838039"
license=('GPL')
depends=('udisks2')
backup=("etc/$pkgname/$pkgname")
install=udisks_functions.install
source=("https://gist.github.com/ledti/838039/raw/d0ecc8c7d148e5a89f81f10ae950650d21461f48/udisks_functions")
sha256sums=('f64af40ec325f851e87d51f7bf855f0a26cc9604ce69f23d5d7d3b6243f0dbfd')

package() {
  install -D -m644 "$srcdir/$pkgname" "$pkgdir/etc/$pkgname/$pkgname"
}
