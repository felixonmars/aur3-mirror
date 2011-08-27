# Maintainer: Alec Ari <neotheuser@ymail.com>

pkgname=superiotool
pkgver=9999
pkgrel=2
pkgdesc="It allows you to detect which Super I/O you have on your mainboard, and it can provide detailed information about the register contents of the Super I/O."
url="http://www.coreboot.org/Superiotool"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion')

build() {
    cd $srcdir
if [ -d superiotool ] ; then
    cd superiotool
    svn update
    make PREFIX=/usr || return 1
    cp -PR superiotool $pkgdir/usr/bin
else
    svn co svn://coreboot.org/coreboot/trunk/util/superiotool superiotool
    cd superiotool
    make PREFIX=/usr || return 1
    mkdir -p $pkgdir/usr/bin
    cp -PR superiotool $pkgdir/usr/bin
fi
}
