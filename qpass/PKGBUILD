# Maintainer: Mateusz Piekos <mateuszpiekos@gmail.com>
pkgname=qpass
pkgver=1.3.2
pkgrel=2
pkgdesc="Easy to use password manager with built-in password generator"
arch=('i686' 'x86_64')
url="http://qpass.sourceforge.net"
depends=('qt4>=4.7' 'libgcrypt')
makedepends=('cmake')
license=('GPL3')
source=(http://downloads.sourceforge.net/project/qpass/source/$pkgname-$pkgver.tar.bz2)
md5sums=('02f036b7a97605be102f31fbcd6886aa')
install=qpass.install

build() {

cd "$srcdir/$pkgname-$pkgver"
mkdir -p "build"
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../
make VERBOSE=1
}

package() {
cd "$srcdir/$pkgname-$pkgver/build"
make DESTDIR="$pkgdir" install
}

