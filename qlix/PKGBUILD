# Maintainer: Mike Stegeman <mrstegeman@gmail.com>

pkgname=qlix
pkgver=0.2.6
pkgrel=3
pkgdesc="Qlix is a small QT based graphical user interface for libmtp to communicate with MTP Basic devices."
arch=('i686' 'x86_64')
url="http://qlix.berlios.de/?page_id=7"
license="GPL"
depends=('libmtp' 'taglib' 'qt4')
source=(http://download.berlios.de/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('7c768f13c2f07b08bff0edd25a3197aa')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    # fix for GCC 4.6
    sed -i -r 's/(.*QMAKE_CXXFLAGS.*)/\1 -fpermissive/' Qlix.pro

    qmake-qt4 || return 1
    make || return 1

    install -Dm755 qlix ${pkgdir}/usr/bin/qlix || return 1
}
