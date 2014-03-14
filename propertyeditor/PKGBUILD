# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=propertyeditor
pkgver=2.1.3
pkgrel=2
pkgdesc="A property editor for qt4."
url="http://code.google.com/p/propertyeditor/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('qt4' 'openssl')
makedepends=('cmake' 'xz')
source=(http://propertyeditor.googlecode.com/files/$pkgname-$pkgver.tar.lzma)
md5sums=('cf48714e60f5ad4b32d7c444e2793051')

build() {
  #lzma -dc ../${pkgname}-${pkgver}.tar.lzma | tar -xv -f -
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
