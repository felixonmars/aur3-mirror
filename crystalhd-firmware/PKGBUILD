# Contributor: Lex Rivera <x-demon@x-demon.org>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=crystalhd-firmware
pkgver=20120110
pkgrel=2
pkgdesc="Crystal HD Video Decoder firmware"
arch=('any')
url="http://www.broadcom.com/support/crystal_hd/"
license=('GPL2')
# Debian have more updated sources
source=("$pkgname-$pkgver.tar.gz::http://ftp.de.debian.org/debian/pool/non-free/f/firmware-crystalhd/firmware-crystalhd_0.0~git20120110.fdd2f19.orig.tar.gz")

package() {
	mkdir -p $pkgdir/usr/lib/firmware/fwbin
	cp -a $srcdir/firmware-crystalhd-0.0~git20120110.fdd2f19/firmware/fwbin/* $pkgdir/usr/lib/firmware/fwbin/
}

md5sums=('e8a0dfad78eacd6bde2c3ff0f217a6c6')
