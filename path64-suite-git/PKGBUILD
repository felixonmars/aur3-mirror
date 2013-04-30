# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=path64-suite-git
pkgver=20130430
pkgrel=1
pkgdesc="Open source version of the EKOPath 4 Compiler Suite"
arch=('x86_64')
url="https://github.com/pathscale/path64-suite"
#url="http://www.pathscale.com/ekopath-compiler-suite"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('path64-git')
conflicts=('path64-git')
options=(!buildflags)
source=('path64-suite::git+git://github.com/pathscale/path64-suite.git')
md5sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
  cd "$srcdir/path64-suite"

  if [ -d compiler ] ; then
    # update the modules
    ./update
    msg "The local files are updated."
  else
    # clone all modules
    ./initial-clone
  fi
}

build() {
  cd "$srcdir/path64-suite"

  # build debug
  mkdir -p "$srcdir/path64-suite-debug"
  cd "$srcdir/path64-suite-debug"
  cmake -DCMAKE_BUILD_TYPE=Debug ../path64-suite
  make

  # build release
  export PATH=$srcdir/path64-suite-debug/Xcompiler/bin:$PATH
  mkdir -p "$srcdir/path64-suite-release"
  cd "$srcdir/path64-suite-release"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=pathcc -DCMAKE_CXX_COMPILER=pathCC -DCMAKE_INSTALL_PREFIX=/opt/path64 ../path64-suite
  make
}

package() {
  cd "$srcdir/path64-suite-release"
  make DESTDIR="$pkgdir/" install
  sed -i 's|#!/usr/bin/python$|#!/usr/bin/python2|' "$pkgdir/opt/path64/bin/explain"
} 
