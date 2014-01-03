# Contributor: ashren <edgar at gmail dot com>

pkgname=getcurpos
pkgver=0.1
pkgrel=4
pkgdesc="A small tool to get the cursor position"
arch=('i686' 'x86_64')
url="http://distro.ibiblio.org/fatdog/source/g/getcurpos.c"
license=('unknown')
depends=('gcc' 'libx11')
source=(http://distro.ibiblio.org/fatdog/source/g/$pkgname.c)
md5sums=('9507304e923777e29b41f9d426fab46e')

build() {

gcc -Wall -lX11 $srcdir/getcurpos.c -o $srcdir/getcurpos
install -D $srcdir/getcurpos $srcdir/pkg/usr/bin/getcurpos

}


