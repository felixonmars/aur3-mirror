# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>
# Author: Erik Meusel <emeusel at cs.uni-magdeburg.de>

pkgname=unlzx
pkgver=1.1
pkgrel=2
pkgdesc="Decompress Amiga lzx archives"
arch=('i686' 'x86_64')
license=('Freeware')
url="http://xavprods.free.fr/lzx/"
source=(http://aminet.net/misc/unix/unlzx.c.gz)

build() {
  cd "$srcdir/"
  cat unlzx.c.gz | gunzip | gcc -x c - -O2 -o unlzx || return 1
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 unlzx "$pkgdir/usr/bin" || return 1
}

md5sums=('aba223c26019d84fad0a1eed109bc628')
