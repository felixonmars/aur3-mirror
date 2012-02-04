# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=adeskmenu
pkgver=0.3.2
pkgrel=4
pkgdesc="A Quick Systray Application Launcher"
arch=('any')
url="http://adeskbar.tuxfamily.org/"
license=('GPL')
depends=('pygtk')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.xz")
noextract=("${source[0]}")
md5sums=('f53ed025bd1c211bfbc52424f30a5f5d')

build() {
  return 0
}

package() {
  tar Jxf ${srcdir}/${source[0]} -C ${pkgdir}
}