# Contributor: Kosyak <ObKo@mail.ru>
pkgname=qextserialport
pkgver=1.2rc
pkgrel=5
pkgdesc="Cross-platform serial port class libary for Qt4 and Qt5."
arch=('i686' 'x86_64')
url="http://code.google.com/p/qextserialport/"
license="BSD"
depends=(qt5-base)
makedepends=(make gcc)
provides=(qextserialport)
source=("http://qextserialport.googlecode.com/files/qextserialport-${pkgver}.zip")
md5sums=('ffa061edb9f64666468d18402eee6108')

build() {
    cd "${srcdir}/qextserialport-${pkgver}"

    qmake-qt5
    make
}

package() {
    cd "${srcdir}/qextserialport-${pkgver}"
    sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' libQt5ExtSerialPort.prl
    make INSTALL_ROOT="$pkgdir" install
}