pkgname='communi'
pkgver='2.0.0'
pkgrel=1
pkgdesc='A cross-platform IRC framework written with Qt'
arch=('i686' 'x86_64')
url='http://communi.github.com/'
license='LGPL'
depends=('qt5-base')
source=('https://github.com/communi/communi/archive/v2.0.0.zip')
md5sums=('a492b44fa92861384229ea52ec3e406b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make "INSTALL_ROOT=$pkgdir" install
}
