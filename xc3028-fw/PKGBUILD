# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=xc3028-fw
pkgver=27
pkgrel=1
pkgdesc='Firmware for TV cards with Xceive xc3028 or similiar tuner'
arch=(i686 x86_64)
url="http://kernel.org"
license=('unknown')
depends=()
makedepends=()
source=('extract_xc3028.pl'
'http://www.steventoth.net/linux/xc5000/HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip')
md5sums=('b1ce9ec19e2fad1bb11979f1696b2a50'
         '7fe395c1a398f079d98e416ee7be3777')

build() {
	cd "$srcdir"

	mv 'Driver85/hcw85bda.sys' .
	./extract_xc3028.pl

	mkdir -p "$pkgdir/lib/firmware/"
	install -Dm 644 xc3028-v27.fw "$pkgdir/lib/firmware"
}

#category: lib
# vim:set ts=2 sw=2 et:
