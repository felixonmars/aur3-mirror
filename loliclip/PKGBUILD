# Maintainer: Cloudef <mailroxas@gmail.com>
# Lightweight clipboard manager for X

pkgname=loliclip
pkgver=2.6
pkgrel=1
pkgdesc='Lightweight clipboard manager for X'
arch=('i686' 'x86_64')
url='http://cloudef.eu'
license=('WTFPL')
depends=('libxcb' 'zlib')
optdepends=('dmenu')
makedepends=('gcc')
source=('loliclip.c' 'config.h' 'lolictrl')
install=loliclip.install

# Debug build?
DEBUG=0
[[ $DEBUG -eq 1 ]] && options=(!strip)

package() {
   [[ $DEBUG -eq 0 ]] || gcc -g              "$srcdir/loliclip.c" -lxcb -lz -o "$srcdir/loliclip"
   [[ $DEBUG -eq 0 ]] && gcc -DNDEBUG -s -Os "$srcdir/loliclip.c" -lxcb -lz -o "$srcdir/loliclip"
   install -Dm775 "$srcdir/lolictrl" "${pkgdir}/usr/bin/lolictrl"
   install -Dm755 "$srcdir/loliclip" "${pkgdir}/usr/bin/loliclip"
}
md5sums=('edbf3a65f142a85ecc21bc99d3827bdc'
         '21a771f2bd892a423fafca24448e6cd7'
         '59cc068fdf91ddc8ff7e21c84dd2feb8')

# vim: set ts=8 sw=3 tw=0 :
