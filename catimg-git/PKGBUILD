# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Ben Reul <breul99<AT>NOSPAM.gmail.com>

_pkgname=catimg
pkgname=catimg-git
pkgrel=1
pkgver=1.1.r2.g98f544e
pkgdesc="Cat for images."
url="http://posva.net/shell/retro/bash/2013/05/27/catimg/"
license=('unknown')
arch=('i686' 'x86_64')
depends=('imagemagick')
makedepends=('git' 'cmake')
source=("git://github.com/posva/catimg.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$_pkgname"
  cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR=$pkgdir install
}
