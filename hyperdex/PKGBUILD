# Maintainer: William Robertson <wkr@wkr.io>

pkgname=hyperdex
pkgver=1.3.0
pkgrel=1
pkgdesc="A searchable distributed key-value store."
arch=('x86_64')
url="http://hyperdex.org/"
license=('BSD')
groups=()
depends=('libe' 'libpo6' 'busybee' 'replicant' 'sparsehash' 'google-glog' 'python2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('b0c2e816a8decc16f9da51e5555f4fcd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PYTHON=python2.7
  ./configure --enable-python-bindings --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
