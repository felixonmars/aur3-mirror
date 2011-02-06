# Contributor: coderoar <coderoar at gmail.com>

pkgname=lib32-scim
pkgver=20090410
pkgrel=1
pkgdesc="A Input Method development platform" 
url="http://www.scim-im.org/projects/scim"
license=("GPL")
arch=("x86_64")
groups=("lib32")
depends=("lib32-gtk2" "lib32-gcc-libs" "scim")
arch=("x86_64")
install="scim.install"

_sourcefile="`ls|grep "scim-.*-i686\.pkg\.tar\.gz"`"
source=("$_sourcefile")
md5sums=()

build() {
    cd ${srcdir}
	# say goodbye to .la files:
	find . -name "*.la" -exec rm {} \;
	mv usr/lib/gtk-2.0 opt/lib32/usr/lib/
	rm -fr usr
	rm -fr opt/lib32/usr/{include,bin,lib/pkgconfig,share}
	cp -pr opt $pkgdir
}
