# Contributor: kang <kang@rsbac.org>
pkgname=rsbac-admin-git
pkgver=20120516
pkgrel=1
pkgdesc="RSBAC is a mandatory access control patch for Linux, this package include the required administration tools"
arch=(i686 x86_64)
url="http://www.rsbac.org"
license=('GPL')
depends=('dialog' 'pam' 'ncurses')
makedepends=('git' 'pam' 'libtool' 'ncurses')
source=()
md5sums=()

_gitroot="git://git.rsbac.org/rsbac-admin"
_gitname="rsbac-admin"
_gitbranch="rsbac-admin-1.4"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
   git clone -b $_gitbranch $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  make PREFIX="/usr" build || return 1
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
} 
