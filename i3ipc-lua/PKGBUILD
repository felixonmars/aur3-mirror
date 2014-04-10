# Maintainer: Tony Crisci <tony@dubstepdish.com>
pkgname=i3ipc-lua
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="An improved Lua library to control i3wm"
arch=('i686' 'x86_64')
url="https://github.com/acrisci/i3ipc-lua"
license=('GPL3')
groups=()
depends=('i3ipc-glib>=0.1.1' 'lua-lgi')
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
source=("https://github.com/acrisci/i3ipc-lua/releases/download/v0.1.2/i3ipc-lua-0.1.2.tar.gz")
noextract=()
md5sums=("e52d3c6e5452372929b205c15621f5fc")

build() {
    cd "$srcdir/i3ipc-lua-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/i3ipc-lua-$pkgver"
	make DESTDIR="$pkgdir/" install
}
