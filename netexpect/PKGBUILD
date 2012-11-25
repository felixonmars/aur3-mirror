# Author: Pierre-Olivier Vauboin <povauboin@gmail.com>

pkgname=netexpect
pkgver=0.20
pkgrel=1
pkgdesc='A framework for manipulating network packets'
arch=('i686' 'x86_64')
url="http://netexpect.org/wiki"
license=('GPL')
depends=('libdnet' 'tcl' 'wireshark-cli')
source=("http://netexpect.org/downloads/netexpect-${pkgver}.tar.bz2")
sha256sums=('21fed583a30c1dde6e54af705d898b6076e5df52f897fde01e3d407918f4c297')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --with-pcap=/usr/include/
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
