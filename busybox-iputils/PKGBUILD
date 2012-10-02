# Maintainer: Daniel Beecham <daniel@lunix.se>

options=(!strip)
pkgname="busybox-iputils"
pkgver="1"
pkgrel=2
pkgdesc="Replaces iputils (and traceroute) with the corresponding utilities from busybox."
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
conflicts=('iputils' 'traceroute')
source=('busybox.missing.ls' 'busybox.iputils.bin.ls'
        'busybox.iputils.usr.sbin.ls')
md5sums=('9ecc4d9fac0f640908d5294d2239968e'
         '6d0df2d1fc14a3e3bd25d997bb4586b6'
         '7d5c972a572eea6199a7ba45f95f492e')

_missing=($srcdir/busybox.missing.ls)
_bin=($srcdir/busybox.iputils.bin.ls)
_usrsbin=($srcdir/busybox.iputils.bin.ls)

build() {
    msg "Creating package directories..."
    mkdir "$pkgdir/bin"
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/sbin"

    msg "Creating symlinks for /bin..."
    msg "$(cat $_bin)"
    for entry in $(cat $_bin) 
        do
        ln -s /bin/busybox $pkgdir/bin/$entry
    done

    msg "Creating symlinks for /usr/sbin..."
    for entry in $(cat $_usrsbin)
        do
        ln -s /bin/busybox $pkgdir/usr/sbin/$entry
    done

    warning "Notice; this package is missing some utilities"
    warning "normally found in iputils. Make sure they are"
    warning "not needed before you install this package:"
    warning "$(cat $_missing)"
}
