# Maintainer: Sindre Føring Devik <sindre.devik@gmail.com>

pkgname=erythrina-git
pkgver=r6.fd4c87b
pkgrel=2
pkgdesc="Fuzzy menu matching"
arch=('i686' 'x86_64')
url="https://github.com/technomancy/erythrina"
license=('GPL3')
makedepends=('git' 'ocaml')
source=("$pkgname"::'git://github.com/technomancy/erythrina.git')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$pkgname
	./build.sh
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname/erythrina $pkgdir/usr/bin
}

