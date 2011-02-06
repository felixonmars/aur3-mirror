# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=panache-lartworks-git
pkgver=20100212
pkgrel=1
pkgdesc="Artworks for the Panache Desktop Environment"
arch=('i686' 'x86_64')
url="http://www.logram-project.org/"
license=('GPL')
depends=()
makedepends=('git')
provides=()
source=()
md5sums=()

_gitroot="git://gitorious.org/logram/desktop.git"
_gitname="desktop"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname

  cd desktop
  cd lartworks

  ## clear tmp
  make clean

  #
  # BUILD HERE
  #

  make || return 1
  make DESTDIR="$pkgdir" install || return 1

}
