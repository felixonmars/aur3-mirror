# Maintainer: Jacob Courtneay <jacob@sporkexec.com>
pkgname=urmpc
pkgver=0.1.0
pkgrel=1
pkgdesc="An MPD client inspired by ncmpcpp using urwid."
arch=(any)
url="http://github.com/sporkexec/urmpc"
license=('GPL')
depends=('python2' 'python-urwid' 'python-mpd')
makedepends=('git')
HOLDVER=1

_gitroot='https://github.com/sporkexec/urmpc.git'
_gitname=urmpc

package() {
  cd "$srcdir"
  rm -rf "$_gitname"
  msg "Connecting to GIT server...."

  git clone "$_gitroot" "$_gitname"

  cd "$_gitname"
  git checkout "tags/$pkgver"
  msg "GIT checkout done or server timeout"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
