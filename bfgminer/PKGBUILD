# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bfgminer
pkgver=2.10.6
pkgrel=1
pkgdesc="Bitcoin miner featuring overclocking, monitoring, fan speed control and remote management. For FPGA/GPU/CPU Bitcoin mining."
arch=('i686' 'x86_64')
depends=('curl' 'jansson' 'ncurses')
makedepends=('make')
optdepends=('libopencl: build with AMD GPU mining support'
            'opencl-catalyst: build with AMD GPU mining support'
            'libcl: build with NVIDIA GPU mining support'
            'yasm: add assembly routines for improved CPU mining support')
url="https://github.com/luke-jr/bfgminer"
license=('GPL3')
source=(http://luke.dashjr.org/programs/bitcoin/files/$pkgname/$pkgver/$pkgname-$pkgver.tbz2
        Makefile.patch)
sha256sums=('40e7756c3db7134efc4071b33743bf8118bb2281de027ffc7b1b27977e47d9d4'
            'f2127806519e40d3c0ab4734378f13b1b798406164dfaa00308aa1cf9ab90a67')
provides=('bfgminer')
conflicts=('cgminer')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  msg "Patching Makefile.am..."
  patch -p1 < ${srcdir}/Makefile.patch

  msg "Running configure..."
  ./configure --prefix=/usr --enable-cpumining

  msg "Running make..."
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  msg "Installing..."
  make DESTDIR="$pkgdir" install
}
