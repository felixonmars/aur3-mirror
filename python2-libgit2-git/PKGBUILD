# Maintainer: Hervé Cauwelier <herve/oursours/net>

pkgname="python2-libgit2-git"
pkgver=20110309
pkgrel=1
pkgdesc="Python bindings for libgit2 (pygit2)"
url="https://github.com/libgit2/pygit2"
depends=('python2' 'libgit2-git' 'openssl' 'zlib')
makedepends=('git' 'libgit2-git')
provides=('python2-libgit2' 'pygit2')
conflicts=('python2-libgit2' 'pygit2')
arch=('any')
license=('GPL2')

_gitroot="https://github.com/libgit2/pygit2.git"
_gitname="pygit2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  python2 setup.py install --root=${pkgdir} || return 1
  python2 setup.py test
}
