# Maintainer: Sindre F. Devik <sindre.devik@gmail.com>

pkgname=qtpanel-git
pkgver=r85.548e4d3
pkgrel=1
pkgdesc="A project to create useful and beautiful panel in Qt"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitorious.org/qtpanel"
depends=('qt4')
makedepends=('cmake' 'git' 'make')
source=('qtpanel-git::git+https://gitorious.org/qtpanel/qtpanel.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $pkgdir
	mkdir -p "usr/bin"
	cp $srcdir/$pkgname/qtpanel "usr/bin"
}
