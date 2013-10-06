# Maintainer: Daniel Narvaez <dwnarvaez@gmail.com> 

pkgname=sugar-artwork-git
pkgver=v0.99.2.0.g96d9cb4
pkgrel=1
pkgdesc="Theme and icons for Sugar"
arch=('i686' 'x86_64')
url="http://sugarlabs.org/"
license=('LGPL')
depends=('python2' 'gtk3' 'gtk2')
makedepends=('git' 'icon-slicer' 'icon-naming-utils')
source=("$pkgname"::'git://github.com/sugarlabs/sugar-artwork.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --tags --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir" install
}
