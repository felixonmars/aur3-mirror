# Contributor: Sylvain HENRY <hsyl20@gmail.com>

pkgname=cl-amd-blas
pkgver=1.8.269
pkgrel=1
pkgdesc="AMD OpenCL Blas Library (Part of APPML)"
arch=('i686' 'x86_64')
url="http://http://developer.amd.com/tools/hc/appmathlibs/Pages/default.aspx"
license=('custom')
makedepends=()
depends=()
optdepends=()
source=(http://developer.amd.com/Downloads/clAmdBlas-$pkgver.tar.gz)
sha256sums=('22c591eed0afa1ad632b61707eaaca0c7d7cf4a620ced7bc36c308825e732488')

build() {
   mkdir -p $pkgdir/opt/clAmdBlas
   ./install-clAmdBlas-$pkgver.sh -accept -installdir=$pkgdir/opt/clAmdBlas

}
