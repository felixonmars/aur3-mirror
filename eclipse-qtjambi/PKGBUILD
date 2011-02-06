# Contributor: Ferrazzo Riccardo <f.riccardo87@gmail.com>
pkgname="eclipse-qtjambi"
pkgver="4.5.0"
pkgrel="01"
pkgdesc="A qtjambi plugin for Eclipse"
url="http://doc.trolltech.com/qtjambi-4.5.2_01/com/trolltech/qt/qtjambi-index.html"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('eclipse')
makedepends=('unzip')
source=('http://get.qt.nokia.com/qtjambi/source/qtjambi-eclipse-integration-win32-4.5.0_01.zip')
md5sums=('0d8040ba9d238fd4ca551d9d68674149')

build() {
  mkdir -p ${pkgdir}/usr/share/eclipse
  cp -R ${srcdir}/plugins ${pkgdir}/usr/share/eclipse/
}
