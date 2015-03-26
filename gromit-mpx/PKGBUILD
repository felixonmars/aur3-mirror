pkgname=gromit-mpx
pkgver=1.1
pkgrel=3
pkgdesc="Desktop annotation tool. GTK3 multi-pointer variant of original gromit utility."
arch=('i686' 'x86_64')
url="https://github.com/bk138/gromit-mpx"
license="custom:Public Domain"
depends=()
optdepends=()
makedepends=('gtk3')
provides=gromit
conflict=gromit
install=
source=("git://github.com/bk138/gromit-mpx.git")
md5sums=('SKIP')

_gitname=gromit-mpx
_gittag=$pkgver

build() {
	cd $srcdir/$_gitname
    git checkout $_gittag
    autoreconf --install
    ./configure --sysconfdir=/etc --prefix=/usr
    make
}

package() {
	cd $srcdir/$_gitname
    make DESTDIR="$pkgdir" install
}
