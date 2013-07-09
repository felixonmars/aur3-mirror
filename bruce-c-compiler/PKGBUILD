# Maintainer: Kelvin Ng (qpalz) <kelvin9302104 at gmail dot com>

pkgname=bruce-c-compiler
pkgver=0.16.17
pkgrel=1
pkgdesc="Bruce's C compiler (bcc) is a simple C compiler that produces 8086 assembler, in addition compiler compile time options allow 80386 or 6809 versions."
arch=('i686' 'x86_64')
license=('GPL')
url=("https://aur.archlinux.org/packages/${pkgname}")

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    md5sums=('13a0292b503eee70cf2e62b710aa7049')
else
    _arch='amd64'
    md5sums=('03495c659621fc006657ec685ce08a85')
fi

source=("http://http.debian.net/debian/pool/main/l/linux86/bcc_${pkgver}-3.1_${_arch}.deb")

package() {
	cd "$srcdir"
	tar -xf data.tar.gz -C $pkgdir
}

