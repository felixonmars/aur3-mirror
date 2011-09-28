# Maintainer: Bryan Bennett <bbenne10@gmail.com>
pkgname=cow-notify-git
pkgver=20110925
pkgrel=1
pkgdesc="Lightweight, customizable notification daemon"
arch=('x86' 'x86_64')
url="https://github.com/Cloudef/cow-notify"
license=('MIT')
makedepends=('git')
options=()
install=cn.install

_giturl="https://github.com/Cloudef/cow-notify.git"
_gitname="cow-notify"
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone $_giturl
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m755 "cow-notify" "$pkgdir/usr/bin/cow-notify"
}

# vim:set ts=2 sw=2 et:
