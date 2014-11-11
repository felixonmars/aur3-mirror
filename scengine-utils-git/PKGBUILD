# Maintainer: spider-mario <spidermario@free.fr>
pkgname=scengine-utils-git
pkgver=0.1.0.469.gd64d034
epoch=1
pkgrel=1
pkgdesc="Free and open-source (GPL) 3D engine (utils)"
arch=('i686' 'x86_64')
url="http://scengine.tuxfamily.org/"
license=('GPL3')
depends=('zlib')
makedepends=('git' 'autoconf' 'automake' 'libtool')
provides=('scengine-utils')
conflicts=('scengine-utils')
source=("git://gitorious.org/scengine/utils.git")
sha512sums=('SKIP')

pkgver() {
  cd utils
  git tag -fm '0.1.0' 0.1.0 1bdf376d20f0bdb42a7e5134455bb97a8c3239d4
  git describe | tr - .
}

build() {
  cd utils

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd utils
  make DESTDIR="$pkgdir/" install
}
