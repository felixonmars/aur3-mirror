# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-flup-hg
_hgrepo='flup-server'
pkgver=121.2281316c3423
pkgrel=2
pkgdesc="random Python WSGI stuff"
arch=(any)
url="http://www.saddi.com/software/flup/"
license=('BSD')
depends=('python2')
makedepends=('mercurial' 'python2-distribute')
provides=('python2-flup')
conflicts=('python2-flup')
source=('hg+http://hg.saddi.com/flup-server')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_hgrepo"
  echo $(hg identify -n).$(hg identify -i)
}

package() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
