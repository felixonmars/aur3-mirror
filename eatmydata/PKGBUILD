# Maintainer: Jonathan Squirawski <webmaster@sky-siteweb.com>

pkgname=eatmydata
pkgver=26.2
pkgrel=1
pkgdesc='libeatmydata wrapper'
arch=('i686' 'x86_64')
url='http://packages.debian.org/eatmydata'
license=('GPL3')
depends=('libeatmydata')
source=(eatmydata
        eatmydata.sh)
md5sums=('c8133355dc1a21694d14498cafa773e7'
         'e47db80805043ef40de12f01e554a643')

build() {
    install -dm755 ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/usr/lib/libeatmydata

    install -m644 eatmydata.sh ${pkgdir}/usr/lib/libeatmydata/eatmydata.sh
    install -m755 eatmydata ${pkgdir}/usr/bin/eatmydata
}
