# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>
pkgname=qmkvextractor-bzr
pkgver=0.3
pkgrel=2
pkgdesc="GUI for mkvextract"
arch=('i686' 'x86_64')
license=('GPL3')
url=("http://qt-apps.org/content/show.php?content=145071")
depends=('qt' 'mkvtoolnix-cli')
makedepends=('bzr')
md5sums=() #generate with 'makepkg -g'

_branch="https://code.launchpad.net/~razrfalcon/+junk/qmkvextractor"
_pkgname=qmkvextractor

build() {
  bzr --no-plugins branch $_branch $_pkgname
  cd $srcdir/$_pkgname
  qmake -config release
  make
  make INSTALL_ROOT="$pkgdir" install
}  
