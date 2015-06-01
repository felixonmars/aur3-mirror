# Maintainer: Federico Damián

pkgname=elementary-add-icon-theme
_pkgname=elementary-add
pkgver=git060115
pkgrel=1
pkgdesc='Additional icons for elementaryOS theme.'
arch=('any')
url='https://github.com/varlesh/elementary-add'
license=('GPLv3')
depends=('elementary-icon-theme')
optdepends=()
makedepends=('git')
conflicts=("${pkgname%}-git")
install="elementary-add-icon-theme.install"
source=('git+https://github.com/varlesh/elementary-add.git')
md5sums=('SKIP')

package() {
  install -d -m 755 "$pkgdir"/usr/share/icons/elementary-add/
  cd $srcdir/elementary-add/elementary-add
  cp -r . "$pkgdir"/usr/share/icons/elementary-add/
}
