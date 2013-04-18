# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=dmz-git
pkgver=2.1ee16ff
pkgrel=1
pkgdesc="Vanilla dmz cursor theme (git version)"
arch=('any')
url="http://github.com/taylorchu/dmz"
license=('GPL2')
depends=()
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/dmz.git")
md5sums=('SKIP')

_gitroot="dmz"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot/pngs"
    ./make.sh

    cd "$srcdir/$_gitroot"

    mkdir -p "$pkgdir"/usr/share/icons/dmz
    cp -r xcursors "$pkgdir"/usr/share/icons/dmz/cursors
}

