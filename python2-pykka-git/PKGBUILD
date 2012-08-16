# Maintainer: Antoine Pierlot-Garcin <antoine at bokbox dot com>
pkgname=python2-pykka-git
pkgver=20120816
pkgrel=1
pkgdesc="Easy to use concurrency abstractions for Python using the actor model"
arch=('any')
url="http://pykka.readthesource.org/"
license=('Apache')
depends=('python2')
makedepends=('git')
optdepends=('python2-gevent: Use gevent based actors from pykka.gevent')
provides=('python2-pykka')
conflicts=('python2-pykka')

_gitroot="git://github.com/jodal/pykka.git"
_gitname="pykka"

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
  python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
