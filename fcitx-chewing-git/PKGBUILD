# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=fcitx-chewing-git
pkgver=0.2.0.10.g9fa428c
pkgrel=1
pkgdesc="Fcitx Wrapper for libchewing (git version)"
arch=('i686' 'x86_64')
url="http://github.com/fcitx/fcitx-chewing"
license=('GPL2')
depends=('fcitx' 'libchewing')
makedepends=('git' 'cmake' 'gettext' 'coreutils' 'sh')
provides=('fcitx-chewing')
conflicts=('fcitx-chewing')
source=("git://github.com/fcitx/fcitx-chewing.git")
md5sums=('SKIP')

_gitroot="fcitx-chewing"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g'
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

