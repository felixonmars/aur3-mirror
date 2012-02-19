# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=git-sync-git
pkgver=20120219
pkgrel=1
pkgdesc="Use git as a sync tool, without munging your source and sync VCS operations"
arch=('any')
url="https://github.com/ianb/git-sync"
license=('unknown')
depends=('git')

_gitroot='git://github.com/ianb/git-sync.git'
_gitname='git-sync'

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m 0755 git-sync "$pkgdir/usr/bin/git-sync"
}

# vim:set ts=2 sw=2 et:
