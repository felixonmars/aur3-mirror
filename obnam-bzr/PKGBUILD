# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
pkgname=obnam-bzr
pkgver=1430
pkgrel=1
pkgdesc="Obnam is an easy, secure backup program."
arch=('i686' 'x86_64')
url="http://liw.fi/obnam/"
license=('GPL3')
groups=()
depends=('python2' 'python2-cliapp-git' 'python2-tracing-git' 'python2-larch-git' 'python2-ttystatus-git' 'python2-paramiko')
makedepends=('bzr')
provides=('obnam')
conflicts=('obnam')
replaces=()
backup=()
options=()
install=
source=("$pkgname::bzr+http://code.liw.fi/obnam/bzr/trunk/")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  bzr revno
}

build() {
  cd "$srcdir/$pkgname"
  sed -ri 's|python|python2|g' check setup.py README tests/*.script
  find . -type f -exec sed -ri "s|^#!/usr/bin/python$|&2|g" '{}' '+'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
