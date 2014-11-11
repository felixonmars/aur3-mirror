# Maintainer: spider-mario <spidermario@free.fr>
pkgname=scengine-renderer-gl-git
pkgver=0.1.0.134.gfcdc4be
epoch=1
pkgrel=1
pkgdesc="Free and open-source (GPL) 3D engine (GL renderer)"
arch=('i686' 'x86_64')
url="http://scengine.tuxfamily.org/"
license=('GPL3')
depends=('scengine-core-git' 'libgl' 'glew')
makedepends=('git' 'autoconf' 'automake' 'libtool')
provides=('scengine-renderer-gl')
conflicts=('scengine-renderer-gl')
source=("git://gitorious.org/scengine/renderer-gl.git")
sha512sums=('SKIP')

pkgver() {
  cd renderer-gl
  git tag -fm '0.1.0' 0.1.0 fc9ee654241b9f6b5105fc3be73b97c9396a41c3
  git describe | tr - .
}

build() {
  cd renderer-gl

  ./autogen.sh
  LDFLAGS= ./configure --prefix=/usr
  make
}

package() {
  cd renderer-gl
  make DESTDIR="$pkgdir/" install
}
