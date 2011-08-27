# $Id:$
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=tree-puzzle
pkgver=5.2
pkgrel=1
pkgdesc="Reconstruction of phylogenetic trees by maximum likelihood."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.tree-puzzle.de"
source=(http://www.tree-puzzle.de/$pkgname-$pkgver.tar.gz)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}

md5sums=('20fa9606434ddc789670e681d98fe68f')
