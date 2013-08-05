# Maintainer:  DasMoeh <belgarath19@web.de>
# Contributor:  Thomas Zervogiannis <tzervo@gmail.com>

pkgname=colpack
pkgver=1.0.9
pkgrel=2
pkgdesc="Graph Coloring for Computing Derivatives"
url="http://www.cscapes.org/coloringpage/"
arch=('any')
license=('LGPL')
depends=()
source=(http://cscapes.cs.purdue.edu/download/ColPack/ColPack-$pkgver.tar.gz)
md5sums=('54ae2daacd00a0a278d2e4fa94bba81b')


build() {
	cd ${srcdir}/ColPack-$pkgver
    ./configure --prefix=/usr
	make
	rm ${srcdir}/ColPack-$pkgver/progs/ColPack
}

package() {
    cd ${srcdir}/ColPack-$pkgver/
    make DESTDIR="${pkgdir}" install
}
