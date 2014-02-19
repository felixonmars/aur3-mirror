_pkgname=muon
pkgname=$_pkgname
pkgver=2.1.2
pkgrel=1
pkgdesc="Content installer"
url="http://muon.kde.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'attica' 'qjson' 'qoauth')
makedepends=('cmake' 'git' 'automoc4')
provides=('muon')

source=("http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6f8e31a09c8b934c711f51ddf06e27585cf2eecd616266498cff3cf3e5b8548a')

prepare() {
    mkdir build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
