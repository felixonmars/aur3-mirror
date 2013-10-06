# Maintainer: Daniel Narvaez <dwnarvaez@gmail.com> 

pkgname=sugar-browse-git
pkgver=v155.2.g092a829
pkgrel=1
pkgdesc="Web browser activity for Sugar"
arch=('i686' 'x86_64')
url="http://sugarlabs.org/"
license=('GPL')
depends=('sugar-toolkit-gtk3-git' 'webkitgtk' 'evince')
makedepends=('git')
source=("$pkgname"::'git://git.sugarlabs.org/browse/mainline.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --tags --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --prefix $pkgdir/usr
}
