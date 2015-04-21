# Maintainer: barrikad <barrikad at bahnhof se>
pkgname=librfc-git
pkgver=r87.dae5fa8
pkgrel=4
pkgdesc='RFC implementations for C/C++'
arch=('i686' 'x86_64')
url="http://librfc.org/"
license=('custom:UNLICENSE')
depends=('libmtp')
makedepends=('gcc' 'autoconf' 'automake' 'libtool' 'git')
conflicts=('librfc' 'librfc-git')
provides=('librfc')
source=('librfc::git+https://github.com/dryproject/librfc.git')
md5sums=('SKIP')
install=librfc-git.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
} 

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -D -m644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
