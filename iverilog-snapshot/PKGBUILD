# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=iverilog-snapshot
pkgver=20130827
pkgrel=1
pkgdesc="Icarus Verilog compiler and simulation tool (Development snapshot)"
arch=('i686' 'x86_64')
url="http://iverilog.icarus.com/"
license=('GPL')
depends=()
makedepends=('gperf' 'bison' 'flex' 'readline')
conflicts=('iverilog')
provides=('iverilog')
source=(ftp://icarus.com/pub/eda/verilog/snapshots/verilog-$pkgver.tar.gz)
md5sums=('0f72b7232380ca8c13a098147b7eee27')

build() {
  cd $srcdir/verilog-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/verilog-$pkgver
  make -j1 prefix="$pkgdir/usr" install
}
