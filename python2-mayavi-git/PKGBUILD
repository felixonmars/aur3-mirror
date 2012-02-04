# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-mayavi-git
pkgver=20110919
pkgrel=1
pkgdesc="The Mayavi scientific data 3-dimensional visualizer"
arch=('i686' 'x86_64')
url="https://github.com/enthought/mayavi"
license=('BSD')
depends=('python2' 'ipython2' 'vtk>=5' 'python2-traitsui' 'python2-apptools'
         'python2-envisage' 'wxpython')
makedepends=('git' 'python2-distribute' 'gcc')
provides=('python2-mayavi')
conflicts=('python-enthought-mayavi' 'python2-mayavi' 'python-ets-mayavi-svn')
replaces=('python-ets-mayavi-svn')
options=(!emptydirs)

_gitroot="https://github.com/enthought/mayavi.git"
_gitname="mayavi"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

