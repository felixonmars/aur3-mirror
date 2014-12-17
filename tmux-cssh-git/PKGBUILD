# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=tmux-cssh-git
pkgver=1.0.6
pkgrel=1
pkgdesc="Parallel Cluster SSH sessions with unified keyboard input using only tmux"
arch=('any')
url="https://github.com/dennishafemann/tmux-cssh"
license=('Apache')
groups=('system')
depends=('tmux')
makedepends=('git')
source=('git+https://github.com/dennishafemann/tmux-cssh.git')
md5sums=('SKIP')

_gitroot="https://github.com/dennishafemann/tmux-cssh.git"
_gitname="tmux-cssh"

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

  # Does not need to be build, script only
}

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  # Create install directories
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/tmux-cssh"
  mkdir -p "$pkgdir/usr/share/doc/tmux-cssh"

  # Pakage
  cd "$srcdir/$_gitname-build"
  install -m755 'tmux-cssh' "$pkgdir/usr/bin"
  install -m644 'LICENSE.md' "$pkgdir/usr/share/licenses/tmux-cssh"
  install -m644 'README.md' "$pkgdir/usr/share/doc/tmux-cssh"
}

# vim:set ts=2 sw=2 et:
