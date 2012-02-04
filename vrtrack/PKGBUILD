# Maintainer: Zach Jaggi <feilen@fluffybutt.in>

pkgname=vrtrack
pkgver=1.0
pkgrel=1
pkgdesc="Vrtrack, a headtracking driver for the VR920 HMD"
arch=('x86' 'x86_64')
license=('creative common noncommercial')
conflicts=('')
url="http://www.mygnu.de"
depends=('ncurses' 'libconfig' 'fuse' 'libusb' 'java-runtime')
source=('https://www.mygnu.de/wp-content/uploads/vrtrack-1.0.tar.gz' 'fix_stddefh_error.patch')
md5sums=('7be756a2ac9fde6b78b7a0c0af246a04'
	 '81a4d3350cb5b47fa2a49ead692a75fa')

build() {
    cd "${srcdir}/vrtrack-${pkgver}"
    #correcting missing stddef.h error
    patch vrtrack.cpp ${srcdir}/fix_stddefh_error.patch
    
    #build!
    make 
}

package() {
    cd "${srcdir}/vrtrack-${pkgver}"
    mkdir -p ${pkgdir}/usr/bin

    install -m 0755 vrtrack ${pkgdir}/usr/bin
    install -m 0755 vrcontrol ${pkgdir}/usr/bin
    install -m 0755 multicastdemoclient ${pkgdir}/usr/bin
    
}

# vim:set ts=4 sw=4 et:
