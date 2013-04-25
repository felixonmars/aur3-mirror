pkgname=monotorrent
pkgver=0.80
pkgrel=1
pkgdesc="MonoTorrent is a cross platform and open source implementation of the BitTorrent protocol."
arch=(i686 x86_64)
license=("MIT X11")
depends=(mono)
options=(!makeflags !emptydirs)
url="http://www.monotorrent.com"
source=("http://www.monotorrent.com/attachments/download/28/monotorrent-0.80.tar.gz"
"MonoTorrent.snk")
md5sums=('1ddedf5132317fe368c9f9fa29d50cec'
         'ac8cbd6a84d772edd5fab11ad0fae35b')

build() {
	cd "$srcdir/monotorrent-$pkgver"
	./configure --prefix=/usr
	make
	for file in `find . -name '*.dll'`; do
		monodis $file --output=${file%.dll}.il
	done
	for file in `find . -name '*.il'`; do
		ilasm /dll /key:$srcdir/MonoTorrent.snk $file
	done
}

package() {
	cd "$srcdir/monotorrent-$pkgver"
	make DESTDIR=$pkgdir install
	find "$pkgdir/usr/lib/monotorrent" -name '*.dll' | xargs -rtl1 -I {} gacutil -i {} -root "$pkgdir/usr/lib"
	find "$pkgdir/usr/lib/monotorrent" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
}
