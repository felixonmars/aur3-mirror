# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
# Contributor: Vaino Helminen <vah78@yahoo.com>
pkgname=smarty
pkgver=2.6.28
pkgrel=1
pkgdesc="Legacy version of Smarty PHP template engine"
url="http://www.smarty.net"
license=("LGPL")
depends=('php')
arch=('any')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.smarty.net/files/Smarty-$pkgver.tar.gz)
md5sums=('ebfaddb5261773c95c87200514602c4f')

package() {
  install -d "$pkgdir/usr/share/php"
  cp -r "$srcdir/Smarty-$pkgver" "$pkgdir/usr/share/php/smarty"
}

