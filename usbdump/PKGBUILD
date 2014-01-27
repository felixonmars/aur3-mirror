# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=usbdump
pkgver=1.0
pkgrel=1
pkgdesc="Simple usbmon frontend for the linux kernel's usbmon facility"
arch=(i686 x86_64)
url="http://biot.com/usbdump/"
license=('GPL3')
depends=('glibc')
source=("http://biot.com/usbdump/$pkgname-$pkgver.tar.gz")
md5sums=('4ed0627e3f7afeb471f975569351ab8c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	gcc -o usbdump usbdump.c
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -m 755 -D usbdump "$pkgdir/usr/bin/usbdump"
	install -m 644 -D README "$pkgdir/usr/share/doc/usbdump/README"
}
