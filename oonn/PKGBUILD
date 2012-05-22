# Maintainer: taylorchu

pkgname=oonn
pkgver=20120521
pkgrel=1
pkgdesc="connman commandline frontend"
arch=("i686" "x86_64")
license=('GPL')
url="https://github.com/taylorchu/oonn"
depends=('connman' 'python2')
makedepends=('git')

_gitname="oonn"
_gitroot="https://github.com/taylorchu/oonn"

build() {
  cd "$srcdir"
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "Starting make..."
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir" install
}

