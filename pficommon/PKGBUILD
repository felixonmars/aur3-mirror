# Maintainer: Hideyuki Tanaka <tanaka.hideyuki@gmail.com>
pkgname=pficommon
pkgver=1.3.1
pkgrel=1
epoch=
pkgdesc="A general purpose C++ library"
arch=('x86_64')
url="https://github.com/pfi/pficommon"
license=('New BSD')
groups=()
depends=('gcc')
makedepends=()
checkdepends=()
optdepends=('msgpack: for MessagePack-RPC' 'mysql: for mysql driver' 'postgresql: for postgresql driver' 'imagemagick: for visualization library')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('718b959491a4047bb5ea249293c2615d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf configure --prefix=/usr
  ./waf build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf --checkall
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./waf --destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
