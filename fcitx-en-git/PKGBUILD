# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=fcitx-en-git
pkgver=89.9823cbe
pkgrel=1
pkgdesc="Fcitx english with statistical autocomplete (git version)"
arch=('i686' 'x86_64')
url="http://github.com/fcitx/fcitx-en"
license=('GPL2')
depends=('fcitx')
makedepends=('git' 'cmake' 'gettext' 'coreutils' 'sh')
provides=('')
conflicts=('')
source=("git://github.com/fcitx/fcitx-en.git")
md5sums=('SKIP')

_gitroot="fcitx-en"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
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

