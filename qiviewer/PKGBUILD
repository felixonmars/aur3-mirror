# Maintainer: dario aguilera <dario_21_06@hotmail.com>

pkgname=qiviewer
pkgver=0.5.0
pkgrel=1
pkgdesc="Another image viewer written in Qt4 - with experimental webp support enabled"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qiviewer"
license=('GPL2')
depends=('qt')
makedepends=('qt')
#install=qiviewer.install
source=(http://qiviewer.googlecode.com/files/qiviewer-${pkgver}.tar.bz2)
sha1sums=('a9f0124c572bf56d893f0bb9a5f892eb17ec4ba8')

build() {
        cd "${srcdir}"/$pkgname/src
        qmake CONFIG+=enable-webp PREFIX=/usr
        make
}
package() {
	cd "${srcdir}"/${pkgname}/src
        make install INSTALL_ROOT="${pkgdir}"
}

