# Maintainer: wido <widomaker2k7@gmail.com>:
pkgname=fortune-mod-southpark-fr
pkgver=20090905
pkgrel=1
pkgdesc="Fortune cookies: The south Park in french."
arch=('any')
license=('GPL')
depends=(fortune-mod)
source=('southpark')
url="http://fr.wikiquote.org/wiki/South_Park"
md5sums=('a2e304928f2e204a3a66c6fd5e857010')

build() {
  cd $startdir/src

  strfile southpark southpark.dat

  install -D -m644 southpark $startdir/pkg/usr/share/fortune/fr/southpark
  install -D -m644 southpark.dat $startdir/pkg/usr/share/fortune/fr/southpark.dat

}
