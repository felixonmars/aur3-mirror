# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=alcantara-git
pkgver=624d388
pkgrel=1
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
  make
}

package(){
   mkdir -p $pkgdir/usr/bin/
   cd "$srcdir/$_gitname"
   make DESTDIR="$pkgdir/usr/bin/" install 
}
