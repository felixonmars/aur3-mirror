# Maintainer: Michael Pusterhofer <pusterhofer (at) student (dot) tugraz (dot) at>
pkgname=gjay-git
pkgver=20111029
pkgrel=1
pkgdesc="Friendly GUI for generating great-sounding playlists across large music collections"
arch=('any')
url="http://gjay.sourceforge.net/"
license=('GPL')
groups=()
depends=('mpg321' 'vorbis-tools' 'audacious' 'gtk2' 'gsl')
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

_gitroot=git://gjay.git.sourceforge.net/gitroot/gjay/gjay 
_gitname=gjay

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
