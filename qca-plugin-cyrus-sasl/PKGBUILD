# Maintainer: bkmz  <libbkmz.dev 'at" gmail [dot) com>
pkgname=qca-plugin-cyrus-sasl
pkgver=2.0.0beta3
pkgrel=1
pkgdesc="cyrus-sasl plugin for qca"
arch=('i686' 'x86_64')
url="http://delta.affinix.com/qca/"
license=('LGPL')
depends=(qt4 qca cyrus-sasl)
source=("http://delta.affinix.com/download/qca/2.0/plugins/qca-cyrus-sasl-2.0.0-beta3.tar.bz2")
md5sums=('db51df751478f60416659809e11990fd')
build() {
    msg "Extractig Sources"
    tar -xvf qca-cyrus-sasl-2.0.0-beta3.tar.bz2
    msg2 "Done extracting!"
    
    cd $srcdir/qca-cyrus-sasl-2.0.0-beta3
    ./configure
    make || return 1
    make INSTALL_ROOT=$pkgdir install
 
}
