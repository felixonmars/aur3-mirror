# Maintainer: wido <widomaker2k7@gmail.com>:
pkgname=fortune-mod-xfiles-fr
pkgver=20090905
pkgrel=1
pkgdesc="Fortune cookies: X-Files in french."
arch=('any')
license=('GPL')
depends=(fortune-mod)
source=('xfiles')
url="http://fr.wikiquote.org/wiki/The_X-Files"
md5sums=('012b26e50bfc0a9c18ce8baf4a91557e')

build() {
  cd $startdir/src

  strfile xfiles xfiles.dat

  install -D -m644 xfiles $startdir/pkg/usr/share/fortune/fr/xfiles
  install -D -m644 xfiles.dat $startdir/pkg/usr/share/fortune/fr/xfiles.dat

}
