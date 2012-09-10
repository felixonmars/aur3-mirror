# Maintainer: Leif Warner <abimelech@gmail.co>
pkgname=zsh-z-git
pkgrel=1
pkgver=20120909
pkgdesc="Jump to frecently-used dirs in zsh"
arch=('any')
url="https://github.com/rupa/z"
license=('unknown')
depends=('zsh')
makedepends=('git')
provides=('zsh-z')
conflicts=('zsh-z')

_gitroot=https://github.com/rupa/z.git
_gitname=z

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m644 z.sh "$pkgdir/usr/share/zsh/site-functions/_z"
  install -D -m644 z.1 "$pkgdir/usr/share/man/man1/z.1"
}

# vim:set ts=2 sw=2 et:
