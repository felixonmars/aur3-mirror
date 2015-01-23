# Maintainer: Shawn Squire <kautiontape@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=torch7
pkgver=7.0.3_0
pkgrel=1
pkgdesc="State of the art machine learning library"
arch=(i686 x86_64)
url="https://github.com/torch/DEPRECEATED-torch7-distro"
license=('GPL')
depends=(gcc-libs qtwebkit lapack)
optdepends=(
  'gnuplot: graph support'
)
makedepends=(git cmake)
source=("https://github.com/torch/DEPRECEATED-torch7-distro/archive/${pkgver/_/-}.tar.gz")
md5sums=('b19d1fbad00dc9d1eee87684712ed833')

build() {
  cd "$srcdir/DEPRECEATED-torch7-distro-${pkgver/_/-}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/DEPRECEATED-torch7-distro-${pkgver/_/-}"
  make install DESTDIR=$pkgdir
  rm -f $pkgdir/usr/{bin/luac,include/lua*}
}
