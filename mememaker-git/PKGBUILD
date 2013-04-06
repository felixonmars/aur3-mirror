# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mememaker-git
_pkgname=mememaker
pkgver=1.1.1.5.g95ae801
pkgver(){
  cd $_pkgname
  git describe --tags |sed 's/-/./g;s/^v//'
}
epoch=1
pkgrel=1
pkgdesc="create memes from the command line, including the posibility to create split memes now with all options available from the command line" 
arch=('any')
url="http://code.gtmanfred.com"
license=('GPL')
depends=('curl' 'imagemagick' 'ttf-ms-fonts')
makedepends=('git')
provides=('mememaker')
conflicts=('mememaker')
install=$_pkgname.install

source=("$_pkgname::git+http://code.gtmanfred.com/cgit/mememaker.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR=$pkgdir INSTALL_DIR=/usr install
}

# vim:set ts=2 sw=2 et:
