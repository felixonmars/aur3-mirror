# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>
pkgname=libaws
pkgver=0.9.2
pkgrel=1
pkgdesc="An Amazon Web Services C++ Library"
arch=(i686 x86_64)
url="http://aws.28msec.com/"
license=('Apache')
groups=()
depends=(curl openssl libxml2)
makedepends=(cmake)
optdepends=(fuse)
source=($pkgname-$pkgver.tar.gz libaws-0.9.2.patch)
noextract=()
md5sums=('0c425a236089fdd9f20008eb778f02c7'
         '2e06f8aa3fe217338695302b3fa30553')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../${pkgname}-${pkgver}.patch
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
