# Maintainer: Daniel Narvaez <dwnarvaez@gmail.com> 

pkgname=sugar-datastore-git
pkgver=v0.99.4.2.g988cbde
pkgrel=1
pkgdesc="Datastore service for Sugar"
arch=('i686' 'x86_64')
url="http://sugarlabs.org/"
license=('GPL')
depends=('python2' 'python2-xapian')
makedepends=('git' 'intltool')
source=("$pkgname"::'git://github.com/sugarlabs/sugar-datastore.git')
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
