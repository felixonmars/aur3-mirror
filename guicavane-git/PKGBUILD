# Maintainer: Roger Duran <rogerduran at gmail dot com>
pkgname=guicavane-git
pkgver=20111230
pkgrel=1
pkgdesc="Graphical User Interface for Cuevana, pelispedia, moviezet, cuevana using freevana"
arch=(any)
url="https://github.com/j0hn/guicavane"
license=('GPL')
depends=('python2' 'pygtk')
makedepends=('git')
md5sums=()

_gitroot="https://github.com/j0hn/guicavane.git"
_gitname="guicavane"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=$pkgdir/
  # Desktop icon
  install -Dm644 guicavane.desktop $pkgdir/usr/share/applications/guicavane.desktop
}

# vim:set ts=2 sw=2 et:
