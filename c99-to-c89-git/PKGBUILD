# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=c99-to-c89-git
pkgver=20121003
pkgrel=1
pkgdesc="Tool to convert C99 code to MSVC-compatible C89"
arch=('i686' 'x86_64')
url="https://github.com/rbultje/c99-to-c89"
license=('Apache')
depends=('clang')
makedepends=('git')

_gitroot=https://github.com/rbultje/c99-to-c89.git
_gitname=c99-to-c89

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
  make CC=clang LDFLAGS="$LDFLAGS -L/usr/lib/llvm"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 c99conv $pkgdir/usr/bin/c99conv
  install -Dm755 c99wrap $pkgdir/usr/bin/c99wrap
}

# vim:set ts=2 sw=2 et:
