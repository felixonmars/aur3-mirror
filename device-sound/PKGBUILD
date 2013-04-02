# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=device-sound
pkgver="$(date +"%Y%m%d%H%M")"
pkgrel=1
pkgdesc='sound notification when device is added or removed'
arch=('any')
url='https://github.com/taylorchu/device-sound'
license=('GPL2')
depends=('udev')
makedepends=('git' 'alsa-utils')
_gitroot="https://github.com/taylorchu/device-sound"
_gitname="device-sound"
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
