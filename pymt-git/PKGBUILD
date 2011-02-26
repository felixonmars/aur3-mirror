# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=pymt-git
pkgver=20110227
pkgrel=1
pkgdesc="An open source library for developing multi-touch applications."
arch=('i686' 'x86_64')
url="http://pymt.eu/"
license=('GPL')
depends=('python-pygame' 'python-imaging' 'gstreamer0.10-python' 'python-opengl' 'cython')
makedepends=('git')
provides=('pymt')
conflicts=('pymt' 'pymt-svn')
replaces=('pymt' 'pymt-svn')

_gitroot="git://github.com/tito/pymt.git"
_gitname="pymt"

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

  #
  # BUILD HERE
  #

  # Python2 fixes
  export PYTHON="python2"
  sed -i "s|env python|&2|;s|bin/python|&2|" \
      `grep -Erl "(env python|bin/python)" .`

  python2 setup.py build
} 

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root=$pkgdir
}
