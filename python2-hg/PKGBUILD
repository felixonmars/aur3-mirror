# -*- shell-script -*-
# Maintainer: Eric Schulte
#
#  Installs in /usr/local to avoid conflicts with the base python2.
#  We can't remove the base python2, because other packages require
#  some libraries provided by the base python2 but not by this
#  package... its messy.
#
pkgname=python2-hg
pkgver=80292
pkgrel=1
pkgdesc='Python Programming Language -- HEAD of the 2.7 bug-fix branch'
arch=('x86_64' 'i686')
url="http://www.python.org"
license=('custom')
depends=()
makedepends=('gcc' 'mercurial' 'python2')
provides=('python2')

_hgroot=http://hg.python.org/
_hgrepo=cpython

_make_w_python2() {
    ln -sf $(which python2) python
    PATH="./:$PATH" make $@
    rm python
}

build() {
  cd "$srcdir"

  hg clone $_hgrepo $_hgrepo-build -u 2.7

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  hg clone "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build" -u 2.7
  cd "$srcdir/$_hgrepo-build"

  ./configure && _make_w_python2
}

package() {
  cd "$srcdir/$_hgrepo-build"

  msg2 "Packaging files..."
  _make_w_python2 DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
