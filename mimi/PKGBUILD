# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=mimi
pkgver="$(date +"%Y%m%d%H%M")"
pkgrel=1
pkgdesc='a working replacement for xdg-open'
arch=('any')
url='https://github.com/taylorchu/mimi'
license=('GPL2')
makedepends=('git')
provides=('xdg-utils')
conflicts=('xdg-utils')

_gitroot="https://github.com/taylorchu/mimi"
_gitname="mimi"
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

    # symlink as "mimi"
    ln -s /usr/bin/xdg-open "$pkgdir/usr/bin/mimi"
}
