# Maintainer: James An <james@jamesan.ca>

pkgname=helium
pkgver=20141230
pkgrel=2
pkgdesc="TODO"
arch=('any')
url="http://www.clockworkmod.com/carbon"
license=('none')
depends=('android-tools')
source=('http://download.clockworkmod.com/carbon/carbon-linux.tgz')
md5sums=('17af8468c35e1b2a70ce74340757826a')

prepare() {
    cd linux

    sed -i 's/^BASE=.*$/BASE=\/usr\/bin/' run.sh
    echo '#!/bin/sh' | cat - run.sh > helium
    mv -f helium run.sh
}

package() {
    cd linux
    install -Dm755 run.sh "$pkgdir/usr/bin/$pkgname"
}
