# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# Made available thanks to user André de Oliveira, in 2011-Nov-08:
# http://www.keepassx.org/forum/viewtopic.php?f=11&t=1947&sid=ed494157ce01f67f15b11f3bcd89c262

pkgname=keepassx-pt-br
pkgver=0.4.3
pkgrel=1
pkgdesc="Brazilian Portuguese translation for KeePassX"
arch=('any')
url="http://www.keepassx.org"
license=('GPL')
depends=('keepassx')
source=("keepassx-pt_BR.tar.gz::$url/forum/download/file.php?id=91")
md5sums=('62db119741a886302385da048950d5e7')

package() {
  install -Dm644 keepassx-pt_BR/keepassx-pt_BR.qm \
      "$pkgdir"/usr/share/keepassx/i18n/keepassx-pt_BR.qm
}

