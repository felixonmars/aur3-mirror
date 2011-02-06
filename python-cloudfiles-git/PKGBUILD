# Contributor: Philip Wrenn <philwrenn@gmail.com>
pkgname=python-cloudfiles-git
pkgver=20091016
pkgrel=1
pkgdesc="Python language bindings for Cloud Files API"
arch=('i686')
url="http://www.rackspacecloud.com/"
license=('GPL')
depends=('python')
makedepends=('git')
optdepends=()
provides=('python-cloudfiles')
conflicts=('python-cloudfiles')

_gitroot="git://github.com/rackspace/python-cloudfiles.git"
_gitname="python-cloudfiles"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [-d $_gitname] ; then
    cd $_gitname && git pull origin
    msg "Local repository has been updated"
  else
    git clone $_gitroot
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
