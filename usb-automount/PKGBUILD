# Maintainer: taylorchu <tailinchu [at] gmail [dot] com>

pkgname=usb-automount
pkgver="$(date +"%Y%m%d%H%M")"
pkgrel=1
pkgdesc='automount usb with only udev rules'
arch=('any')
url='https://github.com/taylorchu/usb-automount'
license=('GPL2')
depends=('udev')
makedepends=('git')
_gitroot="https://github.com/taylorchu/usb-automount"
_gitname="usb-automount"
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
