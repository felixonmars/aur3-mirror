# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

# In testing because it isrequired by soundgrain, 
# and it has (as the time of writing) just bugfixes in comparison to 0.02

pkgname=python2-pyo-svn
pkgver=541
pkgrel=1
pkgdesc="A Python module written in C to help digital signal processing script creation"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyo/"
license=('GPL')
provides=('python-pyo' 'pyo' 'python2-pyo')
conflicts=('python-pyo' 'pyo' 'python-pyo-svn' 'pyo-svn')
depends=('python2' 'portmidi' 'portaudio' 'liblo' 'libsndfile')

_svntrunk="http://pyo.googlecode.com/svn/trunk/"
_svnmod="pyo"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  cd "$srcdir/$_svnmod-build"

  export PYTHON="python2"
  python2 setup.py --use-jack build

  python2 setup.py install --use-jack --root="$pkgdir/"

#   cd "$srcdir/$_svnmod-build/doc"
#   install -d $pkgdir/usr/share/doc/pyo
#   cp -R * $pkgdir/usr/share/doc/pyo
}
