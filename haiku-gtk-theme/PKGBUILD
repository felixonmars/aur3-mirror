# Maintainer: David Couzelis <drcouzelis@gmail.com>

pkgname=haiku-gtk-theme
pkgver=0.1
pkgrel=1
pkgdesc="The Haiku GTK+ theme from ZevenOS"
arch=(any)
url="http://www.zevenos.com/download/themes"
license=('MIT')
source=(http://www.zevenos.com/wp-content/uploads/2009/11/Haiku.tar.gz)
md5sums=('7a8266052b8a61810054a4ccc6c8e6b0')

build() {
  install -d "$pkgdir"/usr/share/themes
  mv "$srcdir"/Haiku "$pkgdir"/usr/share/themes/Haiku
}
