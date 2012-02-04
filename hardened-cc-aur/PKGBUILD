#

pkgname=hardened-cc-aur
pkgver=1.32
pkgrel=1
pkgdesc='Perl wrapper for GCC. Taken and modified from the hardening-wrapper (Ubuntu/Debian) package '
arch=('any')
license=('unknown')
url='https://wiki.ubuntu.com/Security/HardeningWrapper'
depends=('perl' 'binutils' 'gcc')
source=('hardened-cc-aur')
md5sums=('04b6bc5f01a658e6bc7967b04101fde8')

build() {
	cd "$srcdir"
	sed "s|/usr/bin/gcc|/usr/bin/g++|g" hardened-cc-aur > hardened-cxx-aur
}

package() {
	mkdir -p -m 0755 "$pkgdir"/opt/usr/bin/
	install -v -m 0555 -o root -p "$srcdir"/hardened-*aur -t "$pkgdir"/opt/usr/bin/
}

