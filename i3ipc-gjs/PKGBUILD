# Maintainer: Tony Crisci <tony@dubstepdish.com>
pkgname=i3ipc-gjs
_gitname=i3ipc-gjs
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="An improved JavaScript library to control i3wm"
arch=('i686' 'x86_64')
url="https://github.com/acrisci/i3ipc-gjs"
license=('GPL3')
groups=()
depends=('i3ipc-glib>=0.1.1' 'gjs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/acrisci/i3ipc-gjs/releases/download/v0.1.2/i3ipc-gjs-0.1.2.tar.gz")
noextract=()
md5sums=("c795b71d452ea1648e12c9723e1da85a")

build() {
    cd "$srcdir/i3ipc-gjs-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/i3ipc-gjs-$pkgver"
	make DESTDIR="$pkgdir/" install
}
