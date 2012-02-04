# Maintainer: Alec Ari <neotheuser@ymail.com>

pkgname=ectool
pkgver=9999
pkgrel=1
pkgdesc="ectool is a small utility that dumps the RAM of a laptop's Embedded/Environmental Controller (EC)."
url="http://www.coreboot.org/Ectool"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion')

build() {
    cd $srcdir
if [ -d ectool ] ; then
    cd ectool
    svn update
    make PREFIX=/usr || return 1
    cp -PR ectool $pkgdir/usr/bin
else
    svn co svn://coreboot.org/coreboot/trunk/util/ectool
    cd ectool
    make PREFIX=/usr || return 1
    mkdir -p $pkgdir/usr/bin
    cp -PR ectool $pkgdir/usr/bin
fi
}
