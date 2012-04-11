# Maintainer: DeedleFake <yisszev at beckforce dot com> 

pkgname=pacgo-git
pkgver=20120411
pkgrel=1
pkgdesc="pacgo is an experimental wrapper for pacman and makepkg with AUR support."
arch=(i686 x86_64)
url="https://www.github.com/DeedleFake/pacgo"
license=('GPL')
depends=(go)
optdepends=("sudo: Run root commands with user password.")
makedepends=('git')

_gitroot=https://github.com/DeedleFake/pacgo
_gitname=pacgo

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

  local TMPDIR="$srcdir/tmp"
  mkdir -p "$TMPDIR"

  msg2 "Compiling..."
  TMPDIR="$TMPDIR" go build -o "$_gitname" -v
}

package() {
  cd "$srcdir/$_gitname-build"

  install -m 755 -D "$_gitname" "$pkgdir/usr/bin/$_gitname"
  install -m 644 -D "$_gitname.bashcomp" "$pkgdir/usr/share/bash-completion/completions/$_gitname"
}

# vim:set ts=2 sw=2 et:
