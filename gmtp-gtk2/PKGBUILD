# This is gtk2 version of gmtp (https://aur.archlinux.org/packages.php?ID=47774)
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gmtp-gtk2
pkgver=1.3.8
pkgrel=2
pkgdesc="A simple MP3 player client for MTP based devices (gtk2 version)"
arch=('i686' 'x86_64')
url="http://gmtp.sourceforge.net/"
license=('BSD')
depends=('dconf' 'gconf' 'flac' 'gtk2' 'libmtp' 'libid3tag' 'libusb' 'libvorbis')
source=("http://downloads.sourceforge.net/gmtp/gMTP-$pkgver/gmtp-$pkgver.tar.gz")
md5sums=('5c2bfcc036486a4541586c629a778023')
conflicts=('gmtp')
provides=('gmtp')

build() {
	cd "$srcdir/gmtp-$pkgver"
	./configure --prefix=/usr --with-gtk2
	make
}

package() {
	cd "$srcdir/gmtp-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
