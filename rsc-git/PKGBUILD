
# Maintainer: Florian Hofmann <fho@f12n.de>

pkgname=rsc-git
pkgver=0.11
pkgrel=1
pkgdesc="RSC is a Code.CoR-Lab project focused on all aspects of reusable library functions in robotics systems."
arch=('i686' 'x86_64')
url="https://code.cor-lab.org/projects/rsc"
license=('unknown')
depends=('boost' 'protobuf' 'spread-daemon')
makedepends=('git' 'cmake')
#conflicts=('expac')
provides=('rsc')
source=("$pkgname"::'git+https://code.cor-lab.org/git/rsc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  #make install
}
