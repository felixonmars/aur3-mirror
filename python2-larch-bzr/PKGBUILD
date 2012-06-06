# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=python2-larch-bzr
pkgver=325
pkgrel=1
pkgdesc="Python B-tree library"
arch=('i686' 'x86_64')
url="http://liw.fi/larch/"
license=('GPL3')
groups=()
depends=('python2' 'python2-tracing')
makedepends=('bzr')
provides=('python2-larch')
conflicts=('python2-larch')
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_bzrtrunk=http://code.liw.fi/larch/bzr/trunk/
_bzrmod=larch

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  find . -type f -exec sed -ri "s|^#!/usr/bin/python$|&2|g" '{}' '+'
  python2 setup.py build
}

package() {
  cd "$srcdir/$_bzrmod-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
