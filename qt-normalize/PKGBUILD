# Maintainer: mosra <mosra@centrum.cz>
pkgname=qt-normalize
pkgver=4.7.3
pkgrel=1
pkgdesc="Utility for normalizing signal and slot signatures in Qt applications"
arch=('i686' 'x86_64')
url='http://marcmutz.wordpress.com/effective-qt/prefer-to-use-normalised-signalslot-signatures/'
license=('GPL3' 'LGPL')
depends=('qt')
_base="https://qt.gitorious.org/qt/qt/blobs/raw/v${pkgver}/util/normalize/"
source=("${_base}main.cpp"
        "${_base}normalize.pro")
md5sums=('d568601c248d7efd806ac97824d951b6'
         '06a99bcb4cb4d8c079ce35d2bfde9130')

build() {
    cd "$srcdir"

    cd "$srcdir"
    qmake normalize.pro
    make
}

package() {
    cd "$srcdir"
    install -D -m755 normalize "$pkgdir/usr/bin/qt-normalize"
}
