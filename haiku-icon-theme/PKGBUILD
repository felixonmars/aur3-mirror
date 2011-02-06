# Maintainer: David Couzelis <drcouzelis@gmail.com>

pkgname=haiku-icon-theme
pkgver=0.1
pkgrel=1
pkgdesc="The Haiku icon theme from ZevenOS"
arch=(any)
url="http://www.zevenos.com/download/themes"
license=('MIT')
source=(http://www.zevenos.com/wp-content/uploads/2009/11/Haiku-Icons.tar.gz)
md5sums=('689cf4f40e2b732ff0bfa6d6fb6b2c6f')

build() {
  install -d "$pkgdir"/usr/share/icons
  mv "$srcdir"/Haiku-Icons "$pkgdir"/usr/share/icons/Haiku
}
