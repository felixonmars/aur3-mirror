# Maintainer: dryes <joswiseman@gmail>
pkgname='unscrambler'
pkgver=0.4
pkgrel=1
pkgdesc='A tool to decrypt and unscramble raw Gamecube/Wii ISO images.'
url='http://www.ingenieria-inversa.cl/?p=9'
arch=('any')
license=('GPL2')
makedepends=('unrar')
source=('http://dl.dropbox.com/u/7803404/unsc04.rar')
noextract=('unsc04.rar')
md5sums=('01e55a56f3ef33b520501e8195856ef3')

build() {
  cd "${srcdir}"
  unrar e 'unsc04.rar' -o+ -p-
  gcc -o 'unscrambler' 'ecma-267.c' 'unscrambler.c'
}

package() {
  install -D -m755 "${srcdir}/unscrambler" "${pkgdir}/usr/bin/unscrambler"
}
