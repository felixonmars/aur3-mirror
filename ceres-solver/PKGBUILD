# Contributor: josedavim <josedtascon@gmail.com>

pkgname=ceres-solver
pkgver=1.10.0
pkgrel=1
pkgdesc="Solver for nonlinear least squares problems"
arch=('i686' 'x86_64')
url="http://ceres-solver.org"
license=('BSD')
makedepends=('gcc-libs' 'cmake>=2.8')
depends=('gflags>=2.1' 'google-glog>=0.3.1' 'eigen>=3.2.1'
      'suitesparse>=4.4' 'protobuf>=2.5')
options=('staticlibs')
#optdepends=('protobuf>=2.5' 'openmp' )
source=("http://ceres-solver.org/$pkgname-$pkgver.tar.gz")
md5sums=('dbf9f452bd46e052925b835efea9ab16')

_cmakeopts=('-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi
            
build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p ./ceres-bin/
  cd ./ceres-bin/
  cmake ${_cmakeopts[@]} ../
  make
  #make -j3
  #make test
}

package ()
{
  cd $srcdir/$pkgname-$pkgver/ceres-bin/
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
