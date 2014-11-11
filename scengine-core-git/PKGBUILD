# Maintainer: spider-mario <spidermario@free.fr>
pkgname=scengine-core-git
pkgver=0.1.0.289.g11f0c08
epoch=1
pkgrel=1
pkgdesc="Free and open-source (GPL) 3D engine (core)"
arch=('i686' 'x86_64')
url="http://scengine.tuxfamily.org/"
license=('GPL3')
depends=('scengine-utils-git' 'devil')
makedepends=('git' 'autoconf' 'automake' 'libtool')
provides=('scengine-core')
conflicts=('scengine-core')
source=("git://gitorious.org/scengine/core.git")
sha512sums=('SKIP')

pkgver() {
  cd core
  git tag -fm '0.1.0' 0.1.0 32dd4dfa2b6e5ba9fef257f4c7be31ab7f495b95
  git describe | tr - .
}

build() {
  cd core

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd core
  make DESTDIR="$pkgdir/" install
}
