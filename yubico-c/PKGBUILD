# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubico-c
pkgver=1.13
pkgrel=1
pkgdesc='Yubico YubiKey C library'
arch=('i686' 'x86_64')
url='https://github.com/Yubico/yubico-c'
license=('BSD')
depends=('curl' 'libusb')
provides=('libyubikey')
conflicts=('libyubikey' 'yubico-c-git')
makedepends=('git' 'asciidoc')
install=yubico-c.install
source=("git://github.com/Yubico/yubico-c.git#tag=libyubikey-${pkgver}")

build() {
	cd yubico-c/

	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd yubico-c/

	make check
}

package() {
	cd yubico-c/

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubico-c/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubico-c/README"
	make DESTDIR="${pkgdir}/" install
}

sha256sums=('SKIP')
