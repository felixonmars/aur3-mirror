# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>

pkgname=dict-freedict-por-eng
pkgver=0.1.1
pkgrel=1
pkgdesc="Portuguese -> English dictionaries for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org"
license=('GPL')
groups=('office')
depends=('dictd')
source=(http://downloads.sourceforge.net/project/freedict/Portuguese%20-%20English/$pkgver/freedict-por-eng-$pkgver.tar.bz2)
md5sums=('b569349e2ac18de8d1ddd774dc9ab1da')

build() {
	mkdir -p $pkgdir/usr/share/dictd
	mv $srcdir/por-eng/por-eng.dict.dz $srcdir/por-eng/por-eng.index $pkgdir/usr/share/dictd
}
