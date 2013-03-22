# Maintainer: Paul A. Hinchberger III <paulhinchberger3 at gmail dot com>
pkgname=pygtk-shutdown-systemd-git
pkgver=20130321
pkgrel=1
pkgdesc="A fork of a simple dialog to shut down the computer using systemd."
arch=('any')
url="https://github.com/BrainwreckedTech/pygtk-shutdown"
license=('GPL')
depends=('python2' 'pygtk')
makedepends=('git')
source=()

_gitroot="git://github.com/BrainwreckedTech/pygtk-shutdown.git"
_gitname="pygtk-shutdown"

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
install -d "$pkgdir/usr/bin"
install -Dm755 "$_gitname-build/pygtk-shutdown-systemd" "$pkgdir/usr/bin/"
}
