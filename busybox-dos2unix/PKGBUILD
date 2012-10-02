# Maintainer: Daniel Beecham <daniel@lunix.se>

options=(!strip)
pkgname="busybox-dos2unix"
pkgver="1"
pkgrel=2
pkgdesc="Converts DOS line endings (CR/LF) to UNIX (LF) or vice-versa, the busybox version."
arch=('any')
url="http://busybox.net/"
license=('GPLv2')
depends=('busybox')
conflicts=('dos2unix')

build() {
    msg "creating package directories"
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"

    msg "creating symlinks for /usr/bin"
    cd $pkgdir/usr/bin
    ln -s /bin/busybox dos2unix
    ln -s /bin/busybox unix2dos
}
 
