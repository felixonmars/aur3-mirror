# Maintainer: Jonathan Laver <jonathan.laver@gmail.com>

pkgname=libcxx-svn
pkgver=176640
pkgrel=1
pkgdesc="a new implementation of the C++ standard library targeting C++0X"
arch=('i686' 'x86_64')
url="http://libcxx.llvm.org/"
license=('MIT' 'custom:UIUC')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'subversion')
source=()
md5sums=()

_svntrunk=http://llvm.org/svn/llvm-project/libcxx/trunk
_svnmod=libcxx

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
    cd $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../$_svnmod
make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$_svnmod/LICENSE.TXT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
