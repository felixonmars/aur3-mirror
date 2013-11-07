# Maintainer: Julien Humbert <julroy67 [AT] gmail.com>

pkgname=tegaki-models-wagomu-japanese
pkgver=0.3
pkgrel=2
pkgdesc="Japanese handwriting models for wagomu engine and use in Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-recognize>=0.3' 'tegaki-wagomu>=0.3')
makedepends=()
source=("http://www.tegaki.org/releases/0.3/models/tegaki-wagomu-japanese-0.3.zip")
md5sums=('a7a97d215959b88221477e5aefeb09a4')

package() {
	cd "$srcdir/tegaki-wagomu-japanese-$pkgver"
	mkdir -p "$pkgdir/usr/share/tegaki/models/wagomu"
	install -D -m644 $srcdir/tegaki-wagomu-japanese-$pkgver/handwriting-ja.meta $pkgdir/usr/share/tegaki/models/wagomu/
        install -D -m644 $srcdir/tegaki-wagomu-japanese-$pkgver/handwriting-ja.model $pkgdir/usr/share/tegaki/models/wagomu/
}

