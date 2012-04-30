
# Maintainer: Wade Carpenter <archwade NOSPAM 20 NOSPAM apex3 AT xoxy NOSPAM net> / NOSPAM /./
pkgname=bittwist
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="Bit-Twist is a simple yet powerful libpcap-based Ethernet packet generator. It is designed to complement tcpdump, which by itself has done a great job at capturing network traffic."
arch=('i686' 'x86_64')
url="http://bittwist.sourceforge.net/"
license=('GPL')
groups=()
depends=('libpcap>=1.2.1')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://prdownloads.sourceforge.net/$pkgname/$pkgname-linux-$pkgver.tar.gz")
noextract=()
md5sums=('8a93e0ae5df3172dabf154ccfd31c49f')

build() {
  cd "$srcdir"/$pkgname-linux-$pkgver
  sed -i "s|^INSTALL =.*$|INSTALL = $(which install) -c|" Makefile
  make
}

package() {
  cd $srcdir/$pkgname-linux-$pkgver
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
