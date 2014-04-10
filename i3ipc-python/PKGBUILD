# Maintainer: Tony Crisci <tony@dubstepdish.com>
pkgname=i3ipc-python
pkgver=0.1.1
pkgrel=2
epoch=
pkgdesc="An improved Python library to control i3wm"
arch=('i686' 'x86_64')
url="https://github.com/acrisci/i3ipc-python"
license=('GPL3')
groups=()
depends=('i3ipc-glib>=0.1.1' 'python-gobject')
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
source=("https://github.com/acrisci/i3ipc-python/releases/download/v0.1.1/i3ipc-python-0.1.1.tar.gz")
noextract=()
md5sums=("7ef0d96ea2355f0204b6d643deeaf80c")

build() {
    cd "$srcdir/i3ipc-python-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/i3ipc-python-$pkgver"
	make DESTDIR="$pkgdir/" install
}
