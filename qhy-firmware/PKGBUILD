# Contributor: Alex Roman <alex dot roman at gmail dot com>
# Maintainer:  Alex Roman <alex dot roman at gmail dot com>
pkgname=qhy-firmware
pkgver=20120329
pkgrel=1
pkgdesc="Firmware for QHY cameras"
arch=(any)
url="http://http://qhyccd.com/"
license=("Proprietary")
depends=("fxload")
makedepends=("git")

_gitroot="git://github.com/AlexRoman/qhy-firmware.git"
_gitname="qhy-firmware"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
}

package() {
    # qhy5v firmware
    mkdir -p "$pkgdir/lib/firmware/qhy"
    cp "$srcdir/$_gitname/qhy5v/qhy5v.hex" "$pkgdir/lib/firmware/qhy/qhy5v.hex"
    chmod 0644 "$pkgdir/lib/firmware/qhy/qhy5v.hex"

    # udev rules
    mkdir -p "$pkgdir/etc/udev/rules.d"
    cp "$srcdir/$_gitname/udev/85-qhy.rules" "$pkgdir/etc/udev/rules.d/85-qhy.rules"
    chmod 0644 "$pkgdir/etc/udev/rules.d/85-qhy.rules"
}

