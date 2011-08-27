# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Paulo Matias <matias archlinux-br org>
pkgname="iverilog-legacy"
pkgver=0.8.7
pkgrel=1
pkgdesc="Verilog compiler and simulation tool - legacy build with synthesis support"
arch=('i686')
url="http://www.icarus.com/eda/verilog/"
license=('GPL')
depends=()
makedepends=('bison' 'flex' 'readline')
source=("ftp://icarus.com/pub/eda/verilog/v0.8/verilog-$pkgver.tar.gz" 
	'headers.patch')
md5sums=('af5d9f842e0f482c1b5206365258c5a0'
	 'cdfea1962b0cd4f1964469008fd7c496')

build() {
  cd "$srcdir/verilog-$pkgver"
  patch -p1 -b < "$srcdir/headers.patch" || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  MAKEFLAGS="" make prefix="$pkgdir/usr" install
}
