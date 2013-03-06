# Maintainer: Jason Jackson <jacksonje@gmail.com>

pkgname=rekollect
pkgver=0.3.3
pkgrel=3
pkgdesc="A rich text note taking application."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/rekollect/"
license=('GPL')
depends=('kdelibs>=4.4')
makedepends=('cmake automoc4')
install=rekollect.install
source=(https://downloads.sourceforge.net/project/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('8ac057c4e50cd36757e6f2de73cb6a63')

build() {
    cd $srcdir
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
          $srcdir/$pkgname-$pkgver
    make

    make DESTDIR=$pkgdir install
}
