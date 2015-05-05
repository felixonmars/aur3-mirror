# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=gigablast-git
pkgver=r2847.b65fd6a
pkgrel=1
pkgdesc='Open source web search engine.'
arch=('i686' 'x86_64')
url='http://www.gigablast.com'
license=('Apache')
depends=('openssl')
makedepends=('git')
source=('gigablast-git::git+https://github.com/gigablast/open-source-search-engine.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-static//g' "$srcdir/$pkgname/Makefile"
}

build() {
	cd "$srcdir/$pkgname"

	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}

