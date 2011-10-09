# Contributor: Hervé Cauwelier <herve ¤ oursours.net>

pkgname="python-dulwich-git"
pkgver=20111009
pkgrel=1
pkgdesc="Pure-Python implementation of the Git file formats and protocols"
url="http://samba.org/~jelmer/dulwich/"
depends=('python2')
makedepends=('git' 'setuptools')
provides=('python-dulwich')
conflicts=('python-dulwich')
arch=('any')
license=('GPL2')

_gitroot="git://git.samba.org/jelmer/dulwich.git"
_gitname="dulwich"

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
}
