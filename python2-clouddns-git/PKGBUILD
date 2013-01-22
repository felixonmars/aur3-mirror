# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=python2-clouddns-git
pkgver=20130117
pkgrel=1
pkgdesc="Python API bindings to Rackspace Cloud DNS"
arch=('any')
url="https://github.com/rackspace/python-clouddns/"
license=('BSD')
depends=('python2')
makedepends=('git')

_gitroot=https://github.com/rackspace/python-clouddns/
_gitname=python-clouddns

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
  python2 setup.py install --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
