# Maintainer: Marco Scarpetta <marcoscarpetta@mailoo.org>
pkgname=qpan-applets-git
pkgver=4.a5161db
pkgrel=1
pkgdesc="A set of (demo) applets for qpan"
arch=('i686' 'x86_64')
url="https://github.com/marcoscarpetta/qpan-applets"
license=('GPL3')
groups=()
depends=('qpan-git')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/marcoscarpetta/qpan-applets
_gitname=qpan-applets

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

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

  rm -rf panel
  git clone "https://github.com/marcoscarpetta/qpan" "panel"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  qmake
  make
}

package() {
  cd $pkgdir
  mkdir usr
  cd "$srcdir/$_gitname-build/build"
  cp -r . "$pkgdir/usr"
}
