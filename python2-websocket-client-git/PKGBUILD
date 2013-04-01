# Maintainer: Matmas <matmas@matmas.net>
pkgname=python2-websocket-client-git
pkgver=20130401
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python2')
makedepends=('git' 'python2')
optdepends=()
provides=('python2-websocket-client')
conflicts=('python2-websocket-client')
options=(!emptydirs)

_gitroot="git://github.com/liris/websocket-client.git"
_gitname="websocket-client"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  git clean -fdx

  msg "Starting make..."
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
