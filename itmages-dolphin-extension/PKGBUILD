# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>
pkgname=itmages-dolphin-extension
pkgver=1.06
pkgrel=4
pkgdesc="ITmages dolphin context menu extension."
arch=('i686' 'x86_64')
url="https://launchpad.net/itmages"
license=('LGPL')
depends=('kdebase-dolphin' 'itmages-service' 'qt')
makedepends=('bzr')
md5sums=() #generate with 'makepkg -g'

_bzrtrunk="https://code.launchpad.net/~itmages/itmages/itmages-dolphin-extension"

build() {
  bzr --no-plugins branch $_bzrtrunk $pkgname
  cd "$srcdir/$pkgname"
  qmake -config release
  make
  make INSTALL_ROOT="$pkgdir" install
}  
