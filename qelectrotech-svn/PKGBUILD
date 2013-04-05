# Maintainer: FoolEcho <foolecho at gmail dot com>
# Creator: chipster
pkgname=qelectrotech-svn
pkgver=2087
pkgrel=1
pkgdesc="An electric diagram editor. Development version."
arch=('i686' 'x86_64')
url="http://qelectrotech.tuxfamily.org/"
license=('GPL2')
depends=('qt4' 'shared-mime-info')
makedepends=('subversion')
provides=('qelectrotech')
conflicts=('qelectrotech')
install='qelectrotech.install'

_svnmod=qelectrotech
source=($_svnmod::svn://svn.tuxfamily.org/svnroot/qet/qet/branches/0.3)
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST"/$_svnmod
  echo "SOURCE DEST: $SRCDEST"
  svnversion
}

prepare() {
  cd "$srcdir"/$_svnmod

  #fast patch (rev 2087)
  sed 's#*display_menu_,#*display_menu_#' -i sources/titleblock/qettemplateeditor.h

  #Arch packaging standards
  sed 's#/usr/local/#/usr/#g' -i qelectrotech.pro
  sed 's#../share/#./share/#g' -i qelectrotech.pro
  sed 's#doc/qelectrotech/#share/doc/qelectrotech/#g' -i qelectrotech.pro
}

build() {
  cd "$srcdir"/$_svnmod
  qmake-qt4 
  make
}

package() {
  cd "$srcdir"/$_svnmod
  make INSTALL_ROOT="$pkgdir/" install
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/
}
