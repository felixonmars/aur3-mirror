# Maintainer: Krzysztof Wloch <wloszekk [at] gmail [dot] com>
pkgname=fasmarm
pkgver=1.31
pkgrel=1
epoch=
pkgdesc="The FASMARM package is a free ARM cross-assembler add-on for FASM"
arch=('i686' 'x86_64')
url="http://arm.flatassembler.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(http://arm.flatassembler.net/FASMARM_full.ZIP)

md5sums=('64bf2e5ed558dd496cd15bc4e0cec50e')

package() {
  cd "$srcdir/"
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/$pkgname
  install -m 755 -t $pkgdir/usr/bin/ fasmarm
  cp -R ReadMe.txt ARMDOC EXAMPLES INCLUDE SOURCE $pkgdir/usr/share/$pkgname
}

# vim:set ts=2 sw=2 et:
