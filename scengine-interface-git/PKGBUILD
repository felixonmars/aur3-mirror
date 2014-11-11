# Maintainer: spider-mario <spidermario@free.fr>
pkgname=scengine-interface-git
pkgver=0.1.0.373.gfb7705f
epoch=1
pkgrel=1
pkgdesc="Free and open-source (GPL) 3D engine (interface)"
arch=('i686' 'x86_64')
url="http://scengine.tuxfamily.org/"
license=('GPL3')
depends=('scengine-renderer-gl-git' 'scengine-core-git' 'scengine-utils-git')
makedepends=('git' 'autoconf' 'automake' 'libtool')
provides=('scengine-interface')
conflicts=('scengine-interface')
source=("git://gitorious.org/scengine/interface.git")
sha512sums=('SKIP')

pkgver() {
  cd interface
  git tag -fm '0.1.0' 0.1.0 61e1926f17929beca7b502d337dc2ad3638d9a90
  git describe | tr - .
}

build() {
  cd interface

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd interface
  make DESTDIR="$pkgdir/" install
}
