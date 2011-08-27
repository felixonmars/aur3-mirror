# Contributor: Achraf cherti <achrafcherti@gmail.com>
pkgname=jargoninformatique
pkgver=1.3.6
pkgrel=1
pkgdesc="French computering dictionary."

url="http://jargon.tuxfamily.org"
source="http://jargon.tuxfamily.org/$pkgname-$pkgver.tar.gz"

makedepends=()
depends=('fltk' 'libxpm')
md5sums=('64f177d27567c0776d254d1cbffc5dc8')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make PREFIX=$startdir/pkg/usr/ install
}

