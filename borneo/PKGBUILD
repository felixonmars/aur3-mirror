# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=borneo
pkgver=0.3.3
pkgrel=2
pkgdesc="very simple and lightweight web browser, based on Qt framework"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=148119"
depends=('qtwebkit')
source=(http://kde-apps.org/CONTENT/content-files/148119-Borneo-${pkgver}.tar.gz)
license=('BSD')
md5sums=('9849b7c7d1d27ad6d7b23b217686ced6')


build() {
  cd ${srcdir}/Borneo
  qmake-qt4
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cd ${srcdir}/Borneo
  install -m755 Borneo ${pkgdir}/usr/bin/Borneo
}
