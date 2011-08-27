# Contributor: Fortunato Ventre (voRia) <vorione@gmail.com>

pkgname=trim
pkgver=1.3
pkgrel=1
pkgdesc="Nintendo DS roms trimmer"
arch=('i686' 'x86_64')
url="http://www.voria.org/dsromsmanager/"
license=('GPL')
source=(http://www.voria.org/files/nds/trim.c)
md5sums=('c1b7c245ed470450e9a680f025212fbb')

build() {
  cd "$srcdir/"
  gcc trim.c -o trim
  install -D -m 755 trim "$pkgdir"/usr/bin/trim || return 1
}

