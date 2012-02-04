# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Manifest0
# Contributor: Andrew Krawchyk <krawch_a@denison.edu>
# Contributor: Simon Legner <simon.legner@gmail.com>
pkgname=phex
pkgver=3.4.2.116
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A java based file sharing program running on the Gnutella Network"
url="http://phex.org/"
license="GPL"
depends=('j2re')
makedepends=()
source=("http://prdownloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.zip" "phex.desktop" "phex.png")
md5sums=('526c0720d6c1f5ba6ecc7e8cff45a305'
	'7f550243e2c51b46432aea0b519729f8'
	'4f42bf07df4baa8f26eda8af9ec3d6de')


build() {
	mkdir -p $startdir/pkg/usr/share/java/phex
	cp $startdir/src/${pkgname}_${pkgver}/lib/* $startdir/pkg/usr/share/java/phex

	mkdir -p $startdir/pkg/usr/bin
	echo -e '#!/bin/sh\njava -jar /usr/share/java/phex/phex.jar' > $startdir/pkg/usr/bin/phex
	chmod 755 $startdir/pkg/usr/bin/phex

	install -D -m 644 $startdir/src/phex.png $startdir/pkg/usr/share/pixmaps/phex.png
	install -D -m 644 $startdir/src/phex.desktop $startdir/pkg/usr/share/applications/phex.desktop
}
