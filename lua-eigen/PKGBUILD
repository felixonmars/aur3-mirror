# submitter: perlawk
# Maintainer: perlawk

pkgname=lua-eigen
pkgver=1.0
pkgrel=1
pkgdesc="Lua bindings for the Eigen C++ template library for linear algebra."
url="https://github.com/devurandom/lua-eigen"
arch=('any')
license=('GPLv3')
depends=( 'lua' 'eigen3' 'lextlib')
optdepends=()
makedepends=()
install=
source=(
"https://github.com/devurandom/lua-eigen/archive/master.zip"
"lunar.hpp"
)
 
build() {
  cd "${srcdir}/lua-eigen-master/src/"
  g++ -I ../../lunar-master -I/usr/include/eigen3 -std=c++11 -fpic -shared \
  angleaxisf.cpp eigen.cpp matrix.cpp quaternionf.cpp util.cpp -o eigen.so -llextlib
}
 
package() {
  luaver=5.2
  pth=$pkgdir/usr/lib/lua/$luaver
  cd "${srcdir}/lua-eigen-master/src/"
	mkdir -p "$pth/"	
	cp -a eigen.so "$pth"	
}
md5sums=('f091ac8ac9bd7a3cd0451f30022bd7e3'
         '0002ba2defe5c10479fac25479f7eb3c')
