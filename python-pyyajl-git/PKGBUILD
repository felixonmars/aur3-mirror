# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=python-pyyajl-git
pkgver=20120219
pkgrel=1
pkgdesc="python2/3 bindings for yajl"
arch=('i686' 'x86_64')
url="https://github.com/rtyler/py-yajl/"
license=('MIT')
depends=('python')
provides=('python2-pyyajl' 'python-pyyajl')
conflicts=('python2-pyyajl' 'python-pyyajl')
makedepends=('python-distribute' 'python2-distribute')

_gitroot="git://github.com/rtyler/py-yajl.git"
_gitname="pyyajl"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build-python2"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build-python2"

  rm -rf "$srcdir/$_gitname-build-python3"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build-python3"

  for py in python{2,3}; do
    cd "$srcdir/$_gitname-build-$py"
    "$py" setup.py build
  done
}

package() {
  for py in python{2,3}; do
    cd "$srcdir/$_gitname-build-$py"
    "$py" setup.py install --optimize=1 --root="$pkgdir/"
  done
}

# vim:set ts=2 sw=2 et:
