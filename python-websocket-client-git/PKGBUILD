# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
# Original Script for python2 version: Matmas <matmas@matmas.net>
pkgname=python-websocket-client-git
pkgver=20130924
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
optdepends=()
provides=('python-websocket-client')
conflicts=('python-websocket-client')
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
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  git clean -fdx

  msg "GIT checking out py3 branch"
  git checkout py3

  msg "Starting make..."
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
