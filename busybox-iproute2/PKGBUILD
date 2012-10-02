# Maintainer: Daniel Beecham <daniel@lunix.se>

options=(!strip)
pkgname="busybox-iproute2"
pkgver="1"
pkgrel=2
pkgdesc="Replaces iproute2 with corresponding utilities from busybox."
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
conflicts=('iproute2')
provides=('iproute2')
source=('busybox.missing.ls')
md5sums=('7d7ee529ccab96d0e0e4d2045efc85b1')

_missing=($srcdir/busybox.missing.ls)

build() {
    msg "Creating package directories..."
    mkdir "$pkgdir/sbin"

    msg "Creating symlinks for /sbin..."
    ln -s /bin/busybox $pkgdir/sbin/ip

    warning "The busybox version of iproute2 is lacking a LOT of features"
    warning "and there is a probability that you might need that stuff in"
    warning "e.g. your initfiles. You probably don't want to install this package!".
    warning "$(cat $_missing)"
    warning "In fact, this version ONLY has the 'ip' binary,"
    warning "which is also lacking features!"
}
 
