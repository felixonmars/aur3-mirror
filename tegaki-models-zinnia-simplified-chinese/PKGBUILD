# Maintainer: Humbert Julien <julroy67 [AT] gmail.com>

pkgname=tegaki-models-zinnia-simplified-chinese
pkgver=0.3
pkgrel=1
pkgdesc="Simplified Chinese handwriting models for zinnia engine and use in Tegaki"
arch=('i686' 'x86_64')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-recognize>=0.3' 'zinnia>=0.05')
makedepends=()
source=("http://www.tegaki.org/releases/0.3/models/tegaki-zinnia-simplified-chinese-0.3.zip")
md5sums=('55d5a444af711af5d66ff60a6cbc20c2')

build() {
	cd "$srcdir/tegaki-zinnia-simplified-chinese-$pkgver"
	
	mkdir -p "$pkgdir/usr/share/tegaki/models/zinnia"
	install -D -m644 $srcdir/tegaki-zinnia-simplified-chinese-$pkgver/handwriting-zh_CN.meta $pkgdir/usr/share/tegaki/models/zinnia/
        install -D -m644 $srcdir/tegaki-zinnia-simplified-chinese-$pkgver/handwriting-zh_CN.model $pkgdir/usr/share/tegaki/models/zinnia/
}
