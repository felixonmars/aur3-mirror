# Maintainer:	Mijo Medvedec <mijo dot medvedec at gmail dot com>
# Contributor:	Heiko Baums <heiko@baums-on-web.de> 

pkgname=keurocalc
pkgver=1.2.3
pkgrel=1
pkgdesc="A universal currency converter and calculator for KDE"
arch=('i686' 'x86_64')
url="http://opensource.bureau-cornavin.com/keurocalc/index.html"
license=('GPL2')
depends=('kdebase-runtime' 'qt4')
makedepends=('cmake' 'automoc4')
source=("http://opensource.bureau-cornavin.com/${pkgname}/sources/${pkgname}-${pkgver}.tgz")
md5sums=('6146f37e9d9ace5c32e9521df2ff8562')
sha256sums=('f6e33fcce3b8670b00c021ee3b2b3ecd5a6f1e7422af28b19a8c18a1cd10ec88')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	..

	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
