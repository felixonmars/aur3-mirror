pkgname=ncurses-ruby-git
pkgver=20120816
pkgrel=1
pkgdesc="A Ruby module for accessing the ncurses library"
arch=('i686' 'x86_64')
url="https://github.com/eclubb/ncurses-ruby"
license=('GPL')
depends=('ruby' 'ncurses')
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/eclubb/ncurses-ruby.git
_gitname=ncurses-ruby

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

  cd "$srcdir/$_gitname-build/ext/ncurses"
  ruby extconf.rb || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build/ext/ncurses"
  make DESTDIR=${pkgdir} install || return 1
}

# vim:set ts=2 sw=2 et:
