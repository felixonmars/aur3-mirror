# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=libarchive-git
_pkgname='libarchive'
pkgver=v3.1.2.40.g4b5f651
pkgrel=1
pkgdesc="Library that can create and read several streaming archive formats. Git version."
arch=('i686' 'x86_64')
url="http://libarchive.org"
license=('BSD')
depends=('acl' 'attr' 'bzip2' 'expat' 'lzo2' 'openssl' 'xz' 'zlib')
makedepends=('git')
conflicts=("$_pkgname")
provides=("$_pkgname"=3.1.2)
source=('git://github.com/libarchive/libarchive.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$_pkgname"

	./build/autogen.sh
	./configure --prefix=/usr --without-xml2
	make clean
	make
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/libarchive/COPYING
}
