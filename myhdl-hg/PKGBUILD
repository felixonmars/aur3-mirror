# Contributor: LUO, Jian <jian (dot) luo (dot) cn _(at)_ gmail (dot) com>

pkgname=myhdl-hg
pkgver=1031
pkgrel=1
pkgdesc="a Python-Based Hardware Description Language (mercurial repo)"
arch=(i686 x86_64)
url="http://www.myhdl.org"
_hgroot="http://hg.myhdl.org"
_hgrepo="myhdl"
source=()
depends=('python')
makedepends=('mercurial' 'iverilog')
optdepends=('iverilog: for Co-Simulation with Icarus Verilog')
license=('LGPL')
provides=('myhdl')
conflicts=('myhdl')
md5sums=()

build() {
  cd $startdir/src/$_hgrepo
  python setup.py install --prefix=/usr --root=$pkgdir

  # Install license
  install -m 0644 -D ./LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt

  # Make cosimulation modules for Icarus Verilog
  cd $startdir/src/$_hgrepo/cosimulation/icarus
  make || return 1
  install -m 0755 -D ./myhdl.vpi $pkgdir/usr/lib/ivl/myhdl.vpi
}
# vim: ts=2 sw=2 et ft=sh
