# Contributor: Baptist BENOIST
pkgname=lddgraph
pkgver=git
pkgrel=1
pkgdesc="lddgraph"
arch=(i686 x86_64)
url="http://www.github.com/bbenoist/lddgraph"
license=('BSD')
depends=('gcc-libs' 'graphviz' 'imagemagick')
makedepends=('git' 'make' 'cmake' 'gcc')
provides=(lddgraph)
conflicts=(lddgraph)

build() {
  cd "$srcdir"
  msg "Connecting to server...."
  if [ -d lddgraph/.git ]; then
    cd lddgraph
    git checkout master
    git pull
  else
    git clone git://github.com/bbenoist/lddgraph.git
    cd lddgraph
    git checkout master
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir"/lddgraph/build
  make install
}
