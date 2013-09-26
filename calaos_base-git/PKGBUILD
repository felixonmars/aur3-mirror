# Maintainer: Baptiste Grenier <baptiste@bapt.name>
pkgname=calaos_base-git
_gitname=calaos_base
pkgver=110.ba879e4
pkgrel=2
pkgdesc="Calaos Base"
arch=('i686' 'x86_64')
url="http://calaos.fr"
license=('GPL3')
depends=('log4cpp' 'libsigc++' 'jansson' 'lua51' 'elementary' 'libvmime-git')
makedepends=('git')
source=("$_gitname::git+https://github.com/calaos/calaos_base")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "$srcdir/$_gitname"
	./autogen.sh --prefix=/usr
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
