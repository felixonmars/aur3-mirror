# Maintainer: Gabriel Pickl <peacemotion@gmail.com> 

pkgname=pidgin-leaguedecline-git
pkgver=r2.4108086
pkgrel=1
pkgdesc="Pidgin plugin that declines LoL invites."
arch=('i686' 'x86_64')
url="https://github.com/peacememories/libpurple-plugin-leaguedecline"
license=('GPLv2')
depends=('pidgin')
makedepends=('cmake')
source=("$pkgname"::'git://github.com/peacememories/libpurple-plugin-leaguedecline.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	cmake .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
