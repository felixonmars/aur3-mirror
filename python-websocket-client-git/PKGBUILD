# Maintainer: Thomas Gubler <thomasgubler@gmail.com>
# Original Script for python2 version: Matmas <matmas@matmas.net>
pkgname=python-websocket-client-git
pkgver=20140917
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
md5sums=('SKIP')

_gitroot="https://github.com/liris/websocket-client.git"
_gitname="websocket-client"
source=(git+$_gitroot)

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
