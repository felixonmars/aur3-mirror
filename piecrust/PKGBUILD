# Maintainer: 404
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=piecrust
pkgver=1.2.0
pkgrel=1
pkgdesc="Static website generator and lightweight CMS in php that’s all managed with text files."
arch=('any')
url="http://bolt80.com/piecrust/"
license=('APACHE')
depends=('php')
install=$pkgname.install
source=("http://backend.bolt80.com/piecrust/version_$pkgver/piecrust.phar")
sha256sums=('2572db84d62369e52f0dab72031c69c78bcc291412e9a0eb0337948fe4ffa04f')

package() {
  install -Dm755 piecrust.phar "$pkgdir"/usr/share/webapps/bin/piecrust.phar
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/webapps/bin/piecrust.phar "$pkgdir"/usr/bin/chef
}
