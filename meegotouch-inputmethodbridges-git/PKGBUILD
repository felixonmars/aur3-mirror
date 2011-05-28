# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=meegotouch-inputmethodbridges
pkgname=$_pkgname-git
pkgver=20110528
pkgrel=1
pkgdesc="Additional inputcontexts for Maliit/Meego Input Methods"
arch=('i686' 'x86_64')
url="http://wiki.meego.com/Maliit"
license=('GPL')
depends=('gtk2')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=meegotouch-inputmethodbridges.install
source=()
noextract=()
md5sums=()

_gitroot="git://gitorious.org/meegotouch-inputmethodbridges/meegotouch-inputmethodbridges.git"
_gitname="meegotouch-inputmethodbridges"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # BUILD
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
} 
