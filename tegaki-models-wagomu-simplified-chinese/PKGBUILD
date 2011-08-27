# Maintainer: Humbert Julien <julroy67 [AT] gmail.com>

pkgname=tegaki-models-wagomu-simplified-chinese
pkgver=0.3
pkgrel=1
pkgdesc="Simplified Chinese handwriting models for wagomu engine and use in Tegaki"
arch=('i686' 'x86_64')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-recognize>=0.3' 'tegaki-wagomu>=0.3')
makedepends=()
source=("http://www.tegaki.org/releases/0.3/models/tegaki-wagomu-simplified-chinese-0.3.zip")
md5sums=('05505adae56b03d4fd5c0545c2825e71')

build() {
	cd "$srcdir/tegaki-wagomu-simplified-chinese-$pkgver"
	
	mkdir -p "$pkgdir/usr/share/tegaki/models/wagomu"
	install -D -m644 $srcdir/tegaki-wagomu-simplified-chinese-$pkgver/handwriting-zh_CN.meta $pkgdir/usr/share/tegaki/models/wagomu/
        install -D -m644 $srcdir/tegaki-wagomu-simplified-chinese-$pkgver/handwriting-zh_CN.model $pkgdir/usr/share/tegaki/models/wagomu/
}
