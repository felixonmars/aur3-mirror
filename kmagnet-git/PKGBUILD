# Contributor: Álvaro Villalba Navarro <vn.alvaro@gmail.com>

pkgname=kmagnet-git
pkgver=20101115
pkgrel=1
pkgdesc="Simple puzzle game with a built-in puzzle editor."
url="http://www.kde-apps.org/content/show.php/kMagnet?content=109111"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdegames-libkdegames')
makedepends=('git' 'cmake' 'automoc4')
provides=('kmagnet')
conflicts=('kmagnet')
source=()
md5sums=()
_gitroot="git://gitorious.org/kmagnet/kmagnet.git"
_gitname="kmagnet"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."
  git clone ${_gitroot}

  msg "GIT checkout done."
  msg "Starting make..."

  cd ${_gitname}
  
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${srcdir}/${_gitname}/build
  make DESTDIR="${pkgdir}" install
}