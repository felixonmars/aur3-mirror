# Maintainer: koneu <koneu93 AT googlemail DOT com>

pkgname=('reflex')
pkgver=2.5.4
_pkgdate=20100906
pkgrel=1
pkgdesc="relocalizable fast lexical scanner"
arch=('i686' 'x86_64')
url="http://invisible-island.net/reflex/reflex.html"
license=('custom')
depends=('glibc' 'm4')
source=("http://invisible-island.net/datafiles/release/reflex.tar.gz")
md5sums=('03ccecc8eee4caa8eca5dc93486aeefb')

build() {
  mkdir -p ${srcdir}/${pkgname}-build
  cd ${srcdir}/${pkgname}-build
  ${srcdir}/${pkgname}-${_pkgdate}/configure \
	  --prefix=/usr \
	  --program-prefix=re

  make
}

package() {
	cd ${srcdir}/${pkgname}-build
	make DESTDIR=${pkgdir} install


	install -Dm644  ${srcdir}/${pkgname}-${_pkgdate}/COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
