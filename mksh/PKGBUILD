# Maintainer: Daniel Hommel <dhommel@gmail.com>
pkgname=mksh
pkgver=R40b
pkgrel=1
pkgdesc="The MirOS KornShell - an enhanced version of the public domain ksh"
url="http://mirbsd.de/mksh"
license=('MirOS') # see http://www.opensource.org/licenses/miros.html
depends=(glibc)
makedepends=(glibc cpio groff)
arch=('i686' 'x86_64')
install=(mksh.install)
source=(mksh.install \
	http://www.mirbsd.org/MirOS/dist/mir/mksh/$pkgname-$pkgver.cpio.gz)
md5sums=('f96df220636c322b97d579c0270d3e3b'
         'afb08b65272ace550ec59b26a876a7de')
build() {
   cd $startdir/src/
   # makepkg can't extract cpio files
   cpio -mid < $pkgname-$pkgver.cpio
   cd $startdir/src/$pkgname
   
   # build and install
   sh Build.sh -r -c lto
   ./mksh test.sh
   mkdir -p $startdir/pkg/bin
   mkdir -p $startdir/pkg/usr/share/man/man1
   mkdir -p $startdir/pkg/usr/share/mksh
   install -c -s -o root -g root -m 555 mksh $startdir/pkg/bin/mksh
   install -c -o root -g root -m 644 mksh.1 $startdir/pkg/usr/share/man/man1/mksh.1
   install -c -o root -g root -m 644 dot.mkshrc $startdir/pkg/usr/share/mksh/dot.mkshrc
}
