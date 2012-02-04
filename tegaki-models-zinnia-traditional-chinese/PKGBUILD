# Maintainer: Humbert Julien <julroy67 [AT] gmail.com>

pkgname=tegaki-models-zinnia-traditional-chinese
pkgver=0.3
pkgrel=1
pkgdesc="Traditional Chinese handwriting models for zinnia engine and use in Tegaki"
arch=('i686' 'x86_64')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-recognize>=0.3' 'zinnia>=0.05')
makedepends=()
source=("http://www.tegaki.org/releases/0.3/models/tegaki-zinnia-traditional-chinese-0.3.zip")
md5sums=('63c1f0d46daeb47c66fedc94cc060f9d')

build() {
	cd "$srcdir/tegaki-zinnia-traditional-chinese-$pkgver"
	
	mkdir -p "$pkgdir/usr/share/tegaki/models/zinnia"
	install -D -m644 $srcdir/tegaki-zinnia-traditional-chinese-$pkgver/handwriting-zh_TW.meta $pkgdir/usr/share/tegaki/models/zinnia/
        install -D -m644 $srcdir/tegaki-zinnia-traditional-chinese-$pkgver/handwriting-zh_TW.model $pkgdir/usr/share/tegaki/models/zinnia/
}
