# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=python2-ws4py-git
_gitname=WebSocket-for-Python
pkgver=20130807
pkgrel=1
pkgdesc="WebSocket library for Python"
arch=('any')
url="https://github.com/Lawouach/WebSocket-for-Python"
license=('BSD')
depends=('python2')
makedepends=('git' 'python2')
optdepends=('python2-cherrypy: CherryPy server'
            'python2-gevent: gevent server'
            'python2-tornado: Tornado client')
conflicts=('python2-ws4py')
provides=('python2-ws4py')
source=('git://github.com/Lawouach/WebSocket-for-Python.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
