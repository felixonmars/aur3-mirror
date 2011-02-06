# Maintainer: Sam Harada <aur at peasantoid dot org>

pkgname=unsit
pkgver=1.5
pkgrel=1
pkgdesc="Utility for decompressing StuffIt/MacBinary archives."
arch=(i686 x86_64)
url="http://www.vectorbd.com/bfd/unix/"
license=('custom')
depends=()
makedepends=()
source=(http://www.vectorbd.com/bfd/unix/unsit15.sh.gz)
md5sums=(4f56b2371c999fef30fc4aa8b824f469)

build() {
    mkdir $srcdir/unsit15
    cd $srcdir/unsit15

    # expand shar
    tail ../unsit15.sh -n +$(grep -n '^#! /bin/sh$' ../unsit15.sh | cut -d : -f 1) | bash
    make || return 1
    install -Dm755 unsit $pkgdir/usr/bin/unsit
    install -Dm644 unsit.1 $pkgdir/usr/share/man/man1/unsit.1
}
