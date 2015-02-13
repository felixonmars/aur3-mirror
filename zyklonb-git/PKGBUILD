# Maintainer: Přemysl Janouch <p.janouch@gmail.com>

pkgname=zyklonb-git
_pkgname=ZyklonB
pkgver=r141.ea72676
pkgrel=1
pkgdesc="Experimental IRC bot & daemon"
url="https://github.com/pjanouch/ZyklonB"
arch=('i686' 'x86_64')
license=('BSD')
options=(zipman)
conflicts=('zyklonb')
provides=('zyklonb')
makedepends=('cmake' 'pkg-config' 'git' 'help2man')
depends=('openssl')
source=('git+https://github.com/pjanouch/ZyklonB.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$_pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make install DESTDIR=$pkgdir
}
