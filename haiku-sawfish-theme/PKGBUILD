# Maintainer: David Couzelis <drcouzelis@gmail.com>

pkgname=haiku-sawfish-theme
pkgver=0.1
pkgrel=1
pkgdesc="The Haiku Sawfish theme from ZevenOS"
arch=(any)
url="http://www.zevenos.com/download/themes"
license=('MIT')
source=(http://www.zevenos.com/wp-content/uploads/2009/11/haiku-deco.tar.gz)
md5sums=('a1f58f4b77395a8699cc7ccc6233fd1c')

build() {
  install -d "$pkgdir"/usr/share/sawfish/themes
  mv "$srcdir"/Haiku "$pkgdir"/usr/share/sawfish/themes/Haiku
}
