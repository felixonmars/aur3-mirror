# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=xdg-autostart
pkgname=$_pkgname-git
pkgver=20110820
pkgrel=1
pkgdesc="binary that runs the autostart files based on the XDG Autostart standard"
arch=(i686 x86_64)
url="http://gitorious.org/$_pkgname"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'automake' 'make')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://gitorious.org/xdg-autostart/$_pkgname.git"
_gitname="$_pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
