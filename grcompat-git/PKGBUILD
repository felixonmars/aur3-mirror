# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=grcompat-git
_pkgname=grcompat
pkgver=20131106
pkgrel=1
pkgdesc="Compatability layer for various gnuradio APIs and libraries"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/guruofquality/grcompat"
license=('GPL')
depends=('gnuradio')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
  make
}

package(){
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
}

# vim: ts=2 sw=2 et:
