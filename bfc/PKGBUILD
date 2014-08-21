# Maintainer: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Alexis Weinreb <alexis.weinreb@espci.fr>

pkgname=bfc
pkgver=1
pkgrel=5
pkgdesc="A minimalistic brainfuck compiler."
arch=('i686' 'x86_64')
url="http://www.muppetlabs.com/~breadbox/bf/"
license=('GPL')
depends=()
makedepends=('nasm' 'coreutils' 'gzip')
source=('http://www.muppetlabs.com/~breadbox/software/tiny/bf.asm.txt' 'bfc.1.gz')

md5sums=('9e9f85906a1c4194ab5ce83ddd058a7d' '7f58bd6ef5da708687275d03e8226b91')

options=('!strip')

build() {
  cd $srcdir
  nasm -f bin -o bfc bf.asm.txt || return 1
}

package() {
  cd $srcdir
  install -d "$pkgdir/usr/bin"
  install -m755 bfc "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/man/man1/"
  install -m644 bfc.1.gz "$pkgdir/usr/share/man/man1/"
}
