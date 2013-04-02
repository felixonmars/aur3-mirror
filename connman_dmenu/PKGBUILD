# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=connman_dmenu
pkgver="$(date +"%Y%m%d%H%M")"
pkgrel=1
pkgdesc='dmenu support for connman'
arch=('any')
url='https://github.com/taylorchu/connman_dmenu'
license=('GPL2')
depends=('dmenu' 'connman')
makedepends=('git')
_gitroot="https://github.com/taylorchu/connman_dmenu"
_gitname="connman_dmenu"
build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"
}

package() {
    cd $_gitname
    make DESTDIR="$pkgdir" install
}
