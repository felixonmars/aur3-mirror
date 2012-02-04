# Contributor: totoloco <totoloco at ushcompu dot com dot ar>
pkgname=python-mongokit-hg
pkgver=320
pkgrel=1
pkgdesc="Framework that try to keep its simplicity when you manage mongodb in python."
arch=('any')
url="http://bitbucket.org/namlook/mongokit/"
license=('BSD')
depends=('python-pymongo')
makedepends=('mercurial')
provides=('python-mongokit')
conflicts=('python-mongokit')
replaces=('python-mongokit')

_hgroot="http://bitbucket.org/namlook"
_hgrepo="mongokit"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  python setup.py install --root=${startdir}/pkg
} 
