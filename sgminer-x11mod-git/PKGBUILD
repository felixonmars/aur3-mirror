# Maintainer: Wayne Hartmann <teodh4@gmail.com>
pkgname=sgminer-x11mod-git
pkgver=4.2.2
pkgrel=4
pkgdesc="A multi-threaded multi-pool GPU miner. x11mod kernel included (-k x11mod)."
arch=('i686' 'x86_64')
url="https://github.com/lasybear/sph-sgminer_x11mod"
license=('GPL3')
depends=('curl' 'libcl' 'libtool' 'pkg-config')
makedepends=('opencl-headers')
optdepends=('ncurses: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
provides=('sgminer')

_gitroot="https://github.com/lasybear/sph-sgminer_x11mod"
_gitbranch="master"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    git clone $_gitroot --single-branch $_gitbranch

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    cd "$srcdir/$_gitbranch"

    ./autogen.sh
    ./configure
    make
}

package() {
    cd "$srcdir/$_gitbranch"
    make DESTDIR="$pkgdir" install
    
}
