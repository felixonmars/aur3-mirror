# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=ttf-runez
pkgver=1
pkgrel=1
pkgdesc="TTF Font interpreting latin alphabet as Runes (Cirth = Artificial dialect from J.R.R. Tolkien's Hobbit). Free for use/modify when not used for spreading (neo-)nacionalism"
arch=('any')
license=('Custom')
url="http://en.wikipedia.org/wiki/Runic_alphabet"
source=("runez.ttf")
md5sums=('72386a3bae3bbc0101b7adeea4d360e8')

build() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF/ || return 1
  cp ${srcdir}/runez.ttf ${pkgdir}/usr/share/fonts/TTF/ || return 1
}
