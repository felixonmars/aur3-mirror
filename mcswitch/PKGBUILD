pkgname=mcswitch
pkgver=0.4.1
pkgrel=1
pkgdesc="MCSwitch provides environment for you to play plural minecraft versions"
arch=('i686' 'x86_64')
url="https://github.com/opamp/MCSwitch"
license=('BSD')
source=("https://github.com/opamp/MCSwitch/archive/0.4.1-2.tar.gz")
depends=('qt5-base' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-imageformats' 'qt5-tools')
makedepends=('cmake')

build() {
    cd ${srcdir}/MCSwitch-0.4.1-2
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir .
    make
}

package(){
    cd ${srcdir}/MCSwitch-0.4.1-2
    make install
}

md5sums=('577c215674ecb4b25d451205aef7d1c7')
