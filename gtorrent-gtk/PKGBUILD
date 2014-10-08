# Maintainer: lluixhi <lluixhi@gmail.com>

pkgname=gtorrent-gtk
# TODO Read pkgver somehow from the repo.
pkgver=0.0.2
pkgrel=7
pkgdesc='A minimalist bittorrent client written by the 4chan technology board (GTK Edition).'
arch=('i686' 'x86_64')
url="https://github.com/gtorrent/gtorrent-gtk"
license=('GPLv3')
depends=('boost' 'gtkmm3' 'libtorrent-rasterbar-1' 'libnotify')
makedepends=('cmake' 'git')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git://github.com/gtorrent/gtorrent-gtk.git")
md5sums=('SKIP')

prepare() {
    # Initialize Core
    cd "$srcdir/gtorrent-gtk/gtorrent-core"
    git submodule init
    git submodule update
}

build() {
    # Build the Package
    cd "$srcdir/gtorrent-gtk"
    mkdir -p build/
    cd build/
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make -j`nproc`
}

package() {
    cd "$srcdir/gtorrent-gtk/build"
    make DESTDIR="$pkgdir" install
}
