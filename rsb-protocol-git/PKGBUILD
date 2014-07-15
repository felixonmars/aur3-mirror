
# Maintainer: Florian Hofmann <fho@f12n.de>

pkgname=rsb-protocol-git
pkgver=0.11
pkgrel=1
pkgdesc="The Robotics Service Bus (RSB) is a message-oriented, event-driven middleware aiming at scalable integration of robotics systems in diverse environments."
arch=('i686' 'x86_64')
url="https://code.cor-lab.org/projects/rsb"
license=('unknown')
depends=('boost' 'protobuf' 'spread-daemon' 'rsc-git')
makedepends=('git' 'cmake')
#conflicts=('expac')
provides=('rsb-protocol')
source=("$pkgname"::'git+https://code.cor-lab.org/git/rsb.git.protocol')
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
