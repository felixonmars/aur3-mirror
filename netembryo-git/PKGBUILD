# Contributor: nepherte <nepherte[at]gmail[dot]com>
pkgname=netembryo-git
pkgver=20120608
pkgrel=1
pkgdesc="A network abstraction library plus some misc utility functions used as foundation for feng, libnemesi and felix."
arch=('i686' 'x86_64')
url="http://www.lscube.org/projects/netembryo"
license=('GPL')
depends=()
makedepends=('git' 'libtool' 'autoconf' 'automake')
provides=('netembryo=$pkgver')
conflicts=('netembryo')
source=()
md5sums=()

_gitroot="git://git.lscube.org/netembryo.git"
_gitname="netembryo"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build

  autoreconf -i
  ./configure
  make 
}

package() {
  cd $srcdir/$_gitname-build
  make DESTDIR="$pkgdir" install
}
