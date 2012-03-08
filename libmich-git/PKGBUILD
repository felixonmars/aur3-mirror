# Contributor: Benoit Michau <michau.benoit@gmail.com>
# Maintainer: s1gma <s1gma@mindslicer.com>

pkgname=libmich-git
pkgver=20120206
pkgrel=1
pkgdesc="A library to manipulate various data formats and network protocols"
arch=('any')
url="http://michau.benoit.free.fr/codes/libmich/"
license=('GPL')
depends=('python2' 'pycrypto')
makedepends=('git')
provides=('libmich')

_gitroot=git://github.com/mitshell/libmich
_gitname=libmich

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --prefix=/usr --optimize 1 --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
