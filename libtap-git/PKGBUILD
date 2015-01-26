# Maintainer : T. Jameson Little <t.jameson.little@gmail.com>
# Contributer : T. Jameson Little <t.jameson.little@gmail.com>
pkgname=libtap-git
_gitname="libtap"
pkgver=0.1.0.r1.g2d23c18
pkgrel=3
pkgdesc="Feature-full TAP producer library in C"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/zorgnax/libtap"
license=("GPL")
depends=()
optdepends=()
makedepends=()
provides=('libtap')
conflicts=('libtap')
install=
source=("libtap::git+https://github.com/zorgnax/libtap.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tag --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"

	make
}

package() {
	cd "$srcdir/$_gitname"
	make PREFIX="${pkgdir}/usr" install
}

