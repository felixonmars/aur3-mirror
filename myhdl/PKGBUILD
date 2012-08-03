# Contributor: Patrick Jackson <PatrickSJackson@gmail.com>
# Contributor: LUO, Jian <jian (dot) luo (dot) cn _(at)_ gmail (dot) com>

pkgname=myhdl
pkgver=0.7
pkgrel=1
pkgdesc="a Python-Based Hardware Description Language"
arch=(i686 x86_64)
url="http://www.myhdl.org"
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('python2')
makedepends=('iverilog')
optdepends=('iverilog: for Co-Simulation with Icarus Verilog')
license=('LGPL')
md5sums=('0dad690fe165e4e8d4b42155b682fb63')

build() {
    cd $srcdir/$pkgname-$pkgver
    # Build and install python files
    python2 setup.py install --root=$pkgdir --prefix=/usr

    # Install license
    install -m 0644 -D ./LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt

    # Make cosimulation modules for Icarus Verilog
    cd $srcdir/$pkgname-$pkgver/cosimulation/icarus
    make
    install -m 0755 -D ./myhdl.vpi $pkgdir/usr/lib/ivl/myhdl.vpi
}