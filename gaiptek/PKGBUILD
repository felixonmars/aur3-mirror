# Maintainer: Luis von Bernus <patersiul@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: mitro <mitro@somecode.com>
pkgname=gaiptek
pkgver=0.1
pkgrel=4
pkgdesc="Gaiptek Tablet Manager"
url="http://aiptektablet.sourceforge.net/"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdelibs3')
makedepends=('gcc' 'make')
source=(http://downloads.sourceforge.net/project/aiptektablet/gaiptek.kde.tar.gz)
md5sums=('6d07a8b2e85738c1da93b41ff7893e2c')

build() {
  cd ${srcdir}/${pkgname}.kde
  ./configure --prefix=/usr --without-arts --with-extra-includes=/opt/kde/include --with-qt-dir=/opt/qt
  make DESTDIR=${pkgdir} LIBS=-lXi
}
package() {
	cd ${srcdir}/${pkgname}.kde
	make DESTDIR=${pkgdir} LIBS=-lXi
}
