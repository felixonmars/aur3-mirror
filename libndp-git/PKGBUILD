# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=libndp
pkgname="$_gitname"-git
pkgver=20130613
pkgrel=1
pkgdesc="Neighbour Discovery library"
arch=(i686 x86_64)
url=https://github.com/jpirko/libndp.git
license=(GPL3)
depends=()
makedepends=(git)
provides=($_gitname)
conflicts=($_gitname)
source=("git+https://github.com/jpirko/libndp.git")
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $_gitname/
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}


build() {
    cd $_gitname/
	./autogen.sh
	./configure --prefix=/usr
}

package() {
    make -C $_gitname DESTDIR="$pkgdir" install
}
