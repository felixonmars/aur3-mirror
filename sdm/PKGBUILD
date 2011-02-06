# Contributor: $pooky Hunter <spookyh@hotmail.com>

pkgname=sdm
pkgver=2.0
pkgrel=1
pkgdesc="Sun Download Manager"
arch=('i686')
url="http://www.sun.com/download/sdm/download.xml"
license=('custom')
depends=('jre')
makedepends=('rpmextract')
source=(http://xoomer.alice.it/spookyh/sdm-2_0-linux-i586.rpm)
md5sums=('bc9d7ab79167cbd04bd396d66bc5df5e')

build() {
  
    rpmextract.sh sdm-2_0-linux-i586.rpm
    
    # copying files
    cd ${startdir}/src
    install -d ${startdir}/pkg/usr/{bin,lib,share}
    cp -r usr/* ../pkg/usr/
}
