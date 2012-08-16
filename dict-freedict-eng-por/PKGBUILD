# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=dict-freedict-eng-por
pkgver=0.2.2
pkgrel=1
pkgdesc="English -> Portuguese dictionaries for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org"
license=('GPL')
groups=('office')
depends=('dictd')
source=(http://downloads.sourceforge.net/project/freedict/English%20-%20Portuguese/$pkgver/freedict-eng-por-$pkgver.tar.bz2)
md5sums=('bbb9030b0565e111470b5f2577793d90')

build() {
	mkdir -p $pkgdir/usr/share/dictd
	mv $srcdir/eng-por/eng-por.dict.dz $srcdir/eng-por/eng-por.index $pkgdir/usr/share/dictd
}
