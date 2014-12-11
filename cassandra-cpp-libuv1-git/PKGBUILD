# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=cassandra-cpp-libuv1-git
pkgver=1.0.0.beta5.r4.g3d851d6
pkgrel=1
pkgdesc="C++ driver for Cassandra. Using libuv 1.x"
arch=('i686' 'x86_64')
url='https://github.com/datastax/cpp-driver'
license=('Apache')
depends=('libuv>=1.0.0' 'boost' 'libssh2' 'openssl' 'zlib')
provides=('cassandra-cpp')
conflicts=('cassandra-cpp-git')
makedepends=('git' 'clang' 'cmake')
source=("$pkgname"::git+https://github.com/datastax/cpp-driver#branch=1.0
        'libuv1.0.patch')
sha256sums=('SKIP'
            '7fe37c9504e6846f808232f8de3e8885436ce9abe69545688bc7fe8cce321c76')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git am --signoff < ../libuv1.0.patch
}

build() {
	cd "${srcdir}/${pkgname}"
  CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
	cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
