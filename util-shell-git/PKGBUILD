# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=util-shell-git
pkgver=8.2898e84
pkgrel=1
pkgdesc="util for bash programming (git version)"
arch=('any')
url="http://github.com/taylorchu/util-shell"
license=('GPL2')
depends=()
makedepends=('git' 'go')
conflicts=()
provides=()
source=("git://github.com/taylorchu/util-shell.git")
md5sums=('SKIP')

_gitroot="util-shell"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

