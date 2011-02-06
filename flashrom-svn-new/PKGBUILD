# Maintainer: Alec Ari <neotheuser@ymail.com>

pkgname=flashrom-svn-new
pkgver=9999
pkgrel=1
pkgdesc="flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips."
url="http://flashrom.org/Flashrom"
arch=('i686' 'x86_64')
conflicts=('flashrom')
license=('GPL')
makedepends=('zlib' 'pciutils' 'subversion' 'libftdi')

build() {
    cd $srcdir
if [ -d flashrom ] ; then
    cd flashrom
    svn update
    make PREFIX=/usr || return 1
    cp -PR flashrom $pkgdir/usr/bin
else
    svn co svn://coreboot.org/flashrom/trunk flashrom
    cd flashrom
    make PREFIX=/usr || return 1
    mkdir -p $pkgdir/usr/bin
    cp -PR flashrom $pkgdir/usr/bin
fi
}
