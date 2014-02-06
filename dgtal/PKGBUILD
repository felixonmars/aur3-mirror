# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=dgtal
pkgver=0.7.0
pkgrel=1
pkgdesc="C++ library and tools for Digital Geometry"
arch=('i686' 'x86_64')
url="http://libdgtal.org/"
license=('LGPL3')
depends=('boost' 'gmp' 'eigen' 'graphicsmagick' 'hdf5-cpp-fortran' 'cairo')
makedepends=('cmake')
# The build system doesn't automatically adapt to available libraries, so
# it's mostly useless to list these as optional dependencies.
#optdepends=('libqglviewer' 'cgal' 'insight-toolkit')
source=("http://libdgtal.org/releases/DGtal-${pkgver}-Source.tar.gz")
md5sums=('6ea4478e8041dd6d51c5331ae820407f')
sha1sums=('2a5bec10b376cfde5c52760340aa553907664d9c')
sha256sums=('b7826582346464932f8eb20e41af2c74c7278bf8f07d6fba8bd648827aa13f79')

prepare() {
  cd "$srcdir/DGtal-0.7"
  mkdir -p build
  cd build
  # All these dependencies are optional.  Rationale: build against
  # libraries that are packaged in [core], [extra], [community].  Don't
  # depend on AUR packages.
  cmake \
    -D WITH_MAGICK=true \
    -D WITH_C11=true \
    -D WITH_OPENMP=true \
    -D WITH_GMP=true \
    -D WITH_EIGEN=true \
    -D WITH_HDF5=true \
    -D WITH_CAIRO=true \
    -D WITH_ITK=false \
    -D WITH_CGAL=false \
    -D WITH_QGLVIEWER=false \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_EXAMPLES=off \
    -D CMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "$srcdir/DGtal-0.7"
  cd build
  make
}

package() {
  cd "$srcdir/DGtal-0.7"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
