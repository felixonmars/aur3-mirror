# Maintainer: Daniel Narvaez <dwnarvaez@gmail.com> 

pkgname=python2-gwebsockets-git
pkgver=v0.3.0.g0255e98
pkgrel=1
pkgdesc="A python websocket server using GLib"
arch=('i686' 'x86_64')
url="https://github.com/dnarvaez/gwebsockets"
license=('GPL')
depends=('python2' 'glib2' 'python2-setuptools')
makedepends=('git')
source=("$pkgname"::'git://github.com/dnarvaez/gwebsockets.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --tags --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd ${srcdir}/${pkgname}
  python2 ./setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 ./setup.py install --root=${pkgdir}
}
