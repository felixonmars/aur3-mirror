pkgname=flatbuffers-git
pkgver=0
pkgrel=3
pkgdesc="Memory Efficient Serialization Library"
arch=(x86_64 i686)
url="http://google.github.io/flatbuffers/"
license=('Apache')
makedepends=(git 'pacman>=4.1' cmake)
source=(flatbuffers::git+https://github.com/google/flatbuffers.git)
md5sums=(SKIP)

prepare() {
  cd "${srcdir}/flatbuffers"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -G "Unix Makefiles"
}

build() {
  cd "${srcdir}/flatbuffers"
  make
}

package() {
  cd "${srcdir}/flatbuffers"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/doc/flatbuffers"
  cp -a docs/*.html docs/html "$pkgdir/usr/share/doc/flatbuffers"
}
