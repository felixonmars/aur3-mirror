# Maintainer: Michail Bitzes <noodlylight@gmail.com>
pkgname=rotini-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Rotini Window Decorator(Emerald fork)"
arch=('i686' 'x86_64')
url="https://github.com/noodlylight/rotini"
license=('GPL')
install="rotini.install"

depends=('fusilli-git' 'libwnck' 'gtk2' 'libxres' 'shared-mime-info' 'xdg-utils'
         'hicolor-icon-theme')
makedepends=('intltool' 'git' 'gcc')

conflicts=('emerald' 'emerald-git' 'emerald0.9')

source=("$pkgname::git+https://github.com/noodlylight/rotini.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh \
		--prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
