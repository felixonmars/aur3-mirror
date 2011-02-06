# Maintainer: wido <widomaker2k7@gmail.com>:
pkgname=fortune-mod-futurama-fr
pkgver=20090905
pkgrel=1
pkgdesc="Fortune cookies: Futurama in french."
arch=('any')
license=('GPL')
depends=(fortune-mod)
source=('futurama')
url="http://fr.wikiquote.org/wiki/Futurama"
md5sums=('16776fa5829570ef6763368f48124b1f')

build() {
  cd $startdir/src

  strfile futurama futurama.dat

  install -D -m644 futurama $startdir/pkg/usr/share/fortune/fr/futurama
  install -D -m644 futurama.dat $startdir/pkg/usr/share/fortune/fr/futurama.dat

}
