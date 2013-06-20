pkgname=nsgenbind
pkgver=0.0.1
pkgrel=1
pkgdesc='nsgenbind from NetSurf (needed to build NetSurf with js)'
arch=('x86_64' 'i686')
url='http://www.netsurf-browser.org/'
license=('GPL')
source=("http://download.netsurf-browser.org/libs/releases/$pkgname-$pkgver-src.tar.gz"
        "bison.patch")
sha256sums=('05eb57a0b6de8ae094826e39620cee9ef9b672e79f755e7810ca98c0a3989552'
            '57f70fb9ea143cbbe5a2c2cbd0a2bfaa32a22c6df84ecaf343a2d04ed86b5a33')
makedepends=(netsurf-buildsystem)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../bison.patch
	make  PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}

