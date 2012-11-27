# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Augusto Rocha Elesbão <aelesbao@gmail.com>
pkgname=tmux-applets-git
pkgver=20121127
pkgrel=1
pkgdesc="A selection of tmux 'applets' such as for cpu frequency, memory usage and pinging"
arch=(any)
url="https://github.com/lmartinking/tmux-applets"
license=('GPL')
groups=()
depends=(tmux)
makedepends=('git' make)
provides=(tmux-applets)
conflicts=()
replaces=()
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/lmartinking/tmux-applets.git
_gitname=tmux-applets

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

  PREFIX="/usr" make
}

package() {
  cd "$srcdir/$_gitname-build"
  PREFIX="/usr" DESTDIR="$pkgdir/" make install
}

# vim:set ts=2 sw=2 et:
