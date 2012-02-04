# Maintainer: Jacob Courtneay <jacob@sporkexec.com>
pkgname=urmpc-git
pkgver=20110828
pkgrel=1
pkgdesc="An MPD client inspired by ncmpcpp using urwid."
arch=(any)
url="http://github.com/sporkexec/urmpc"
license=('GPL')
depends=('python2' 'python-urwid' 'python-mpd')
makedepends=('git')

_gitroot='https://github.com/sporkexec/urmpc.git'
_gitname=urmpc

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
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
