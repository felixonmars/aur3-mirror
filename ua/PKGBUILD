# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=ua
pkgver=r2.00be42b
pkgrel=1
pkgdesc="Universal Aggregator"
arch=(i686 x86_64)
url="http://github.com/sloonz/ua"
license=(BSD)
depends=(libxml2)
makedepends=(go python)
optdepends=(
	'python-pyquery: for mangareader2json and ipboard2json'
	'python-aiohttp: for mangareader2json and ipboard2json'
)
source=("ua"::"git://github.com/sloonz/ua")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/ua"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/ua"
	make
}

package() {
	cd "$srcdir/ua"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

