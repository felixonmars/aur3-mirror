# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=springgraph
pkgver=0.88
pkgrel=1
pkgdesc='Graph rendering tool, alternative to neato'
arch=('any')
url='http://www.chaosreigns.com/code/springgraph/' 
license=('GPL')
depends=('perl-gd')
source=('http://www.chaosreigns.com/code/springgraph/dl/springgraph.pl')
md5sums=('12b52e4fcf7e8bf138773f2bde014895')

build() {
  install -D -m0755 springgraph.pl $pkgdir/usr/bin/springgraph
}

