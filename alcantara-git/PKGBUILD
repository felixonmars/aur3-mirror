# Packager: duca
# Contributor: duca 
pkgname=alcantara-git
pkgver=c343f9d
pkgrel=2
pkgdesc="Qt based launcher similar in spirit to dmenu but graphical."
url="https://github.com/duca/Alcantara"
arch=('i686' 'x86_64')
license="GPL2"
depends=('qt4' 'dbus')
optdepends=()
makedepends=('git')
provides=('alcantara-git')
conflicts=('alcantara-git')
source=("git://github.com/duca/Alcantara.git")
md5sums=('SKIP')

_gitname="Alcantara"


pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  qmake-qt4 Alcantara.pro PREFIX=/usr/bin
  make
}

package(){
#   mkdir -p $pkgdir/usr/bin/
   cd "$srcdir/$_gitname"
   make INSTALL_ROOT=$pkgdir install
}
