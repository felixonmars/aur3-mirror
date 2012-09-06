# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Paulo Matias <matias archlinux-br org>
pkgname="iverilog"
pkgver=0.9.6
pkgrel=1
pkgdesc="Icarus Verilog compiler and simulation tool"
arch=('i686' 'x86_64')
url="http://iverilog.icarus.com/"
license=('GPL')
depends=(zlib bzip2 gcc-libs sh)
makedepends=('bison' 'flex' 'readline')
changelog=$pkgname.changelog
source=("ftp://ftp.icarus.com/pub/eda/verilog/v0.9/verilog-$pkgver.tar.gz")
md5sums=('a77d847198c571ba2bfd55b99162c3b6')

build() {
  cd $srcdir/verilog-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/verilog-$pkgver
  make -j1 prefix="$pkgdir/usr" install
}
