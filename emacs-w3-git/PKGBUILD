# Contributor: Bram Duvigneau <bram@bramd.nl>
pkgname=emacs-w3-git
pkgver=20090412
pkgrel=1
pkgdesc="A webbrowser in Emacs"
arch=('i386' 'x86_64')
url="http://www.gnu.org/software/w3"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-w3')
source=()
md5sums=()

_gitroot="git://git.sv.gnu.org/w3"
_gitname="w3"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make prefix="$pkgdir/usr" install
} 
