pkgname=d2clr-qt-git
pkgver=2014.04.31
pkgrel=1
pkgdesc="GUI for d2clrd"
url="https://github.com/FTCr/d2clr-gui"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc' 'hicolor-icon-theme' 'python-pyqt4' 'd2clr-git')
source=("git://github.com/FTCr/d2clr-gui.git")
md5sums=('SKIP')
build(){
  cd "${srcdir}/d2clr-gui"
  ./install -r $pkgdir -i
}
