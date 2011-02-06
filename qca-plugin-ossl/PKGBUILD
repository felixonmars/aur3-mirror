# Maintainer: bkmz  <libbkmz.dev 'at" gmail [dot) com>
pkgname=qca-plugin-ossl
pkgver=2.0.0beta3
pkgrel=1
pkgdesc="ossl plugin for qca"
arch=('i686' 'x86_64')
url="http://delta.affinix.com/qca/"
license=('LGPL')
depends=(qt qca openssl)
source=("http://delta.affinix.com/download/qca/2.0/plugins/qca-ossl-2.0.0-beta3.tar.bz2")
md5sums=('bdc62c01321385c7da8d27b3902910ce')
build() {
    msg "Extractig Sources"
    tar -xvf qca-ossl-2.0.0-beta3.tar.bz2
    msg2 "Done extracting!"
    
    cd $startdir/src/qca-ossl-2.0.0-beta3
    ./configure
    make || return 1
    make INSTALL_ROOT=$startdir/pkg install
 
}
