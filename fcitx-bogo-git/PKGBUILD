# Maintainer: Trung Ngo <ndtrung at gmail dot com>
# Based on PKGBUILD file for fcitx-chewing-git

pkgname=fcitx-bogo-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Fcitx Wrapper for bogo-python (git version)"
arch=('i686' 'x86_64')
url="https://github.com/BoGoEngine/fcitx-bogo"
license=('GPL3')
depends=('fcitx' 'python')
makedepends=('git' 'cmake' 'fcitx' 'python')
provides=('fcitx-bogo')
conflicts=('fcitx-bogo')
source=("git://github.com/BoGoEngine/fcitx-bogo.git")
md5sums=('SKIP')

_gitroot="fcitx-bogo"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    mkdir -p "$srcdir/$_gitroot/build"
    msg "Starting make..."
    cd "$srcdir/$_gitroot/build"
    cmake ".." -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/$_gitroot/build"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

