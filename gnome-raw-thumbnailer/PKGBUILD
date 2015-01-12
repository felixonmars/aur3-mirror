# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=gnome-raw-thumbnailer
pkgver=0.9.2
pkgrel=1
epoch=3
pkgdesc="This is a RAW file thumbnailer for GNOME."
url="http://returnfalse.net/log/gnome-3-and-nautilus-video-thumbnails-with-ffmpegthumbnailer/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libopenraw')
conflicts=('raw-thumbnailer')
source=(http://raw-thumbnailer.googlecode.com/files/raw-thumbnailer-0.2.1.tar.gz)
md5sums=('a39282120d8f754e9f6adb768d65b72a')
build() {

	cd ${srcdir}/raw-thumbnailer-0.2.1

	./configure --prefix=/usr
	make

}

package () {

	mkdir -p $pkgdir/usr/share/thumbnailers

cat >> gnome-raw-thumbnailer.thumbnailer << EOF
[Thumbnailer Entry]
TryExec=raw-thumbnailer
Exec=raw-thumbnailer -i %i -o %o -s %s
MimeType=image/x-dcraw;image/x-adobe-dng;image/x-canon-crw;image/x-canon-cr2;image/x-fuji-raf;image/x-kodak-dcr;image/x-kodak-k25;image/x-kodak-kdc;image/x-minolta-mrw;image/x-nikon-nef;image/x-olympus-orf;image/x-panasonic-raw;image/x-panasonic-raw2;image/x-pentax-pef;image/x-sigma-x3f;image/x-sony-srf;image/x-sony-sr2;image/x-sony-arw;
EOF

	install -m644 gnome-raw-thumbnailer.thumbnailer $pkgdir/usr/share/thumbnailers
	install -m644 gnome-raw-thumbnailer.thumbnailer $pkgdir/usr/share/thumbnailers/raw.thumbnailer
	
	cd ${srcdir}/raw-thumbnailer-0.2.1

	make DESTDIR="$pkgdir" install

}
