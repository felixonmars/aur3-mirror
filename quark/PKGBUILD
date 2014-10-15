# Maintainer: Tim Langlois <langlois at cs dot cornell dot edu>
pkgname=quark
pkgver=0.9.0
pkgrel=1
pkgdesc="A library that enables the dynamic execution of tasks with data dependencies in a multi-core, multi-socket, shared-memory environment."
arch=('i686' 'x86_64')
url="http://icl.cs.utk.edu/quark/index.html"
license=('bsd')
depends=()
options=('staticlibs')
source=(http://icl.cs.utk.edu/projectsfiles/quark/pubs/quark-0.9.0.tgz)
md5sums=('52066a24b21c390d2f4fb3b57e976d08')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=$pkgdir/usr install
}

