# Maintainer: Dominik Fuchs <d dot fuchs at mail dot com>

pkgname=qgmailnotifier-svn
pkgver=r6
pkgrel=1
pkgdesc='A portable Qt-based Gmail notifier'
arch=('i686' 'x86_64')
url='https://code.google.com/p/qgmailnotifier/'
license=('GPL')
depends=('qt5-base')
makedepends=('subversion')
conflicts=('qgmailnotifier')
provides=("qgmailnotifier")
source=("$pkgname::svn+http://qgmailnotifier.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
   cd $pkgname
   qmake
   make || return 1
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,}
  make INSTALL_ROOT="${pkgdir}/usr" install

}
