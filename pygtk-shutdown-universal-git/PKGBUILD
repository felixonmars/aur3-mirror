# Maintainer: Brett Heinkel <bheinks at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>

pkgname=pygtk-shutdown-universal-git
pkgver=20120116
pkgrel=1
pkgdesc="A fork of ummaintained shutdown-dialog. Build is intended to be indiscriminate of WM/DE. Original patches not included."
arch=('i686' 'x86_64')
url="https://github.com/bheinks/pygtk-shutdown"
license=('GPL')
depends=('python2' 'pygtk' 'gksu' 'pm-utils')
makedepends=('git')
conflicts=('shutdown-dialog' 'pygtk-shutdown-git' 'pygtk-shutdown-svn' 'pygtk-shutdown-awesome-git')
source=()

_gitroot="git://github.com/bheinks/pygtk-shutdown.git"
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
  install -Dm755 "$_gitname-build/pygtk-shutdown" "$pkgdir/usr/bin/"
}
