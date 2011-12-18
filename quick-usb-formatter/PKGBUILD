# Mantainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Callea Gaetano Andrea <callea:gaetano:andrea/gmail:com>

pkgname=quick-usb-formatter
pkgver=0.4.1
pkgrel=2
pkgdesc="A tiny app designed to enhance the usability of the device notifier plasmoid by adding an additional option for quick format usb sticks"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=137493"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
provides=('quick-usb-formatter')
source=("http://sourceforge.net/projects/chakra/files/Tools/Quick-Usb-Formatter/${pkgname}-${pkgver}.tar.gz")
md5sums=('fe724d8e4a392bb20caf245acb4bf9ad')

build() {
    cd ${srcdir}/chakra-$pkgname/
    if [[ ! -d build ]]; then
        mkdir build
    else 
        rm -rf build
    fi
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
    make || return 1
    make DESTDIR=${pkgdir} install
}
